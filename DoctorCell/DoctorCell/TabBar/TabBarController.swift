//
//  TabBarController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var viewModel: TabBarViewModel
    
    let productsNavigationController: UINavigationController
    let otherVC: UIViewController
    
    required init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
        
        let productsViewController = ProductsViewController(viewModel: viewModel.productsViewModel)
        productsNavigationController = UINavigationController(rootViewController: productsViewController)
        
        otherVC = UIViewController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarItems()
        addChild(productsNavigationController)
        addChild(otherVC)
    }
    
    func setupTabBarItems() {
        productsNavigationController.tabBarItem = UITabBarItem(title: "Produtos", image: nil, tag: 0)
        otherVC.tabBarItem = UITabBarItem(title: "Avaliação", image: nil, tag: 1)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let viewControllers = viewControllers, item.tag < viewControllers.count else { return }
        
        viewModel.tabCoordinator.updateCurrentChild(to: viewControllers[item.tag])
    }
}

extension TabBarController: SceneControllerProtocol {
    typealias T = TabBarViewModel
}
