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
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Produtos"
        setupViewConfiguration()
    }
    
    func generateFlowLayout(for collectionPadding: CGFloat) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let padding: CGFloat = 10
        let width = self.view.bounds.width / 2 - collectionPadding - padding
        layout.itemSize = CGSize(width: width, height: self.view.bounds.height / 3)
        layout.minimumLineSpacing = padding * 2
        layout.minimumInteritemSpacing = padding
        
        return layout
    }
    
    func bindProductsToCollection() {
        collectionView.register(type: ProductCollectionViewCell.self)
        let identifier = ProductCollectionViewCell.reuseIdentifier
        viewModel.products.bind(to: collectionView.rx.items(cellIdentifier: identifier)) { (index, model, cell) in
                
            }.disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductsViewController: SceneControllerProtocol {}

extension ProductsViewController: ViewConfigurator {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func configureViews() {
        collectionView.backgroundColor = view.backgroundColor
        bindProductsToCollection()
        addRefreshToCollection()
    }
    
    func addRefreshToCollection() {
        let refreshControl = UIRefreshControl()
//        collectionView.refreshControl = refreshControl
    }
}
