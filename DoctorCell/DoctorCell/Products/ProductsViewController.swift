//
//  ViewController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

final class ProductsViewController: UIViewController {
    var viewModel: ProductsViewModel
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let productvm = ProductDetailViewModel(coordinator: self.viewModel.coordinator)
            self.viewModel.coordinator.transition(to: .productDetail(productvm), type: .push)
        }
    }
}

extension ProductsViewController: SceneControllerProtocol {}

