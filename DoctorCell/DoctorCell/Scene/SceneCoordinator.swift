//
//  SceneCoordinator.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//
import UIKit

protocol SceneCoordinatorProtocol {
    init(window: UIWindow)
    
    /// transition to another scene
//    @discardableResult
    func transition(to scene: Scene, type: SceneTransitionType)
    
    /// pop scene from navigation stack or dismiss current modal
//    @discardableResult
    func pop(animated: Bool)
}

final class SceneCoordinator: SceneCoordinatorProtocol {
    fileprivate let window: UIWindow
    fileprivate var currentViewController: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentViewController = window.rootViewController ?? UIViewController()
    }
    
    //if the controller is a navigation, returns the first
    func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController {
            return navigationController.viewControllers.first!
        } else {
            return viewController
        }
    }
    
    func transition(to scene: Scene, type: SceneTransitionType) {
        let viewController = scene.viewController()
        switch type {
        case .root:
            currentViewController = actualViewController(for: viewController)
            window.rootViewController = viewController
        case .push:
            break
        case .modal:
            break
        }
    }
    
    func pop(animated: Bool) {
        
    }
}
