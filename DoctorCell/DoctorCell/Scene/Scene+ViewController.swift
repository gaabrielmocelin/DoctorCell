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
        case .tabBar(let tabBarViewModel):
            return TabBarController(viewModel: tabBarViewModel)
        case .productDetail(let productDetailViewModel):
            return ProductDetailViewController(viewModel: productDetailViewModel)
        }
    }
}
