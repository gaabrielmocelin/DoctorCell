//
//  ViewController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit
import RxSwift

final class ProductsViewController: UIViewController {
    var viewModel: ProductsViewModel
    let disposeBag = DisposeBag()
    
    lazy var collectionView: UICollectionView = {
        let padding: CGFloat = 20
        let layout = generateFlowLayout(for: padding)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Informe o nome do produto"
        return search
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 0.9999880195, alpha: 1), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.003264126712, green: 0.09993152014, blue: 0.303418028, alpha: 1), for: .highlighted)
        button.isHidden = true
        return button
    }()
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Produtos"
        setupViewConfiguration()
        listenToAdminRequest()
    }
    
    func listenToAdminRequest() {
        viewModel.loginRequested
            .map { !$0 }
            .bind(to: loginButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.loginRequested
            .bind(to: collectionView.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    func bindProductsToCollection() {
        collectionView.register(type: ProductCollectionViewCell.self)
        let identifier = ProductCollectionViewCell.reuseIdentifier
        
        viewModel.products
            .observeOn(MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: identifier)) { (index, item, cell) in
                guard let cell = cell as? ProductCollectionViewCell else { return }
                cell.setup(with: item)
            }.disposed(by: disposeBag)
    }
    
    func generateFlowLayout(for collectionPadding: CGFloat) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let padding: CGFloat = 10
        let width = self.view.bounds.width / 2 - collectionPadding - padding
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        layout.minimumLineSpacing = padding * 2
        layout.minimumInteritemSpacing = padding
        
        return layout
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductsViewController: SceneControllerProtocol {}

extension ProductsViewController: ViewConfigurator {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(loginButton)
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func configureViews() {
        collectionView.backgroundColor = view.backgroundColor
        setupSearchBar()
        addRefreshToCollection()
        bindProductsToCollection()
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchController
        let text = searchController.searchBar.rx
                        .text
                        .orEmpty
                        .asObservable()
        
        let cancel = searchController.searchBar.rx
                        .cancelButtonClicked
                        .map { "" }
        
        Observable.merge(text, cancel)
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)
    }
    
    func addRefreshToCollection() {
        let refreshControl = UIRefreshControl()
        collectionView.refreshControl = refreshControl
        refreshControl.rx.bind(to: viewModel.fetchProducts, input: ())
    }
}
