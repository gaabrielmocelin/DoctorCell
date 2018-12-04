//
//  TabBarCoordinator.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

//protocol TabBarCoordinatorProtocol: SceneCoordinatorProtocol {
//    func updateCurrentChild(to child: UIViewController)
//}
//
//class TabBarCoordinator: SceneCoordinator, TabBarCoordinatorProtocol {
//    required init(window: UIWindow) {
//        super.init(window: window)
//    }
//    
//    /// needs to update the current vc when the tab bar changes the current vc
//    ///
//    /// - Parameter child: the current vc that tab bar is presenting
//    func updateCurrentChild(to child: UIViewController) {
//        if let navigationController = child as? UINavigationController {
//            let controllers = navigationController.viewControllers
//            currentViewController = controllers.contains(currentViewController) ? controllers.first! : controllers.last!
//        } else {
//            currentViewController = actualViewController(for: child)
//        }
//    }
//}
