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
    let containerView = ContainerProductsView()
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindProductsToCollection()
        navigationItem.title = "Produtos"
    }
    
    override func loadView() {
        view = containerView
    }
    
    func bindProductsToCollection() {
        let identifier = ProductCollectionViewCell.reuseIdentifier
        viewModel.products.bind(to: containerView.collectionView.rx.items(cellIdentifier: identifier)) { (index, model, cell) in
                print("binded")
            }.disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductsViewController: SceneControllerProtocol {}

