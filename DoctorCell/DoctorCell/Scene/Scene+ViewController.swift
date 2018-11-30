//
//  Scene+ViewController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case .products(let productsViewModel):
            return UINavigationController(rootViewController: ProductsViewController(viewModel: productsViewModel))
        case .productDetail(let productDetailViewModel):
            return ProductDetailViewController(viewModel: productDetailViewModel)
        }
    }
}
