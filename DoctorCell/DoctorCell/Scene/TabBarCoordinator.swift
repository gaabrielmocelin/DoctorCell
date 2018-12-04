//
//  TabBarCoordinator.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

class TabBarCoordinator: SceneCoordinator {
    required init(window: UIWindow) {
        super.init(window: window)
    }
    
    /// needs to update the current vc on coordinator when the tab bar changes the current vc
    func updateCurrentChild(to child: UIViewController) {
        if let navigationController = child as? UINavigationController {
            let controllers = navigationController.viewControllers
            currentViewController = controllers.contains(currentViewController) ? controllers.first! : controllers.last!
        } else {
            currentViewController = actualViewController(for: child)
        }
    }
    
    /// if the controller is the tabBar, returns the first vc on the array
    override func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let tabBarController = viewController as? TabBarController {
            let firstVC = tabBarController.viewControllers!.first!
            return actualViewController(for: firstVC)
        } else {
            return super.actualViewController(for: viewController)
        }
    }
}
