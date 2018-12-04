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

    func transition(to scene: Scene, type: SceneTransitionType)
    func pop(animated: Bool)
}

class SceneCoordinator: SceneCoordinatorProtocol {
    fileprivate let window: UIWindow
    var currentViewController: UIViewController {
        didSet{
            print(currentViewController)
        }
    }
    
    required init(window: UIWindow) {
        self.window = window
        currentViewController = window.rootViewController ?? UIViewController()
    }
    
    func transition(to scene: Scene, type: SceneTransitionType) {
        let viewController = scene.viewController()
        switch type {
        case .root:
            window.rootViewController = viewController
            currentViewController = actualViewController(for: viewController)
        case .push:
            guard let navigationController = currentViewController.navigationController else {
                fatalError("can not present vc without a current navigation")
            }
            navigationController.pushViewController(viewController, animated: true)
            currentViewController = actualViewController(for: viewController)
        case .modal:
            currentViewController.present(viewController, animated: true, completion: nil)
            currentViewController = actualViewController(for: viewController)
        }
    }
    
    func pop(animated: Bool) {
        if let presenter = currentViewController.presentingViewController {
            currentViewController.dismiss(animated: animated, completion: nil)
            currentViewController = actualViewController(for: presenter)
        }else if let navigationController = currentViewController.navigationController {
            navigationController.popViewController(animated: animated)
            currentViewController = actualViewController(for: navigationController.viewControllers.last!)
        }
    }
    
    /// if the controller is a navigation, returns the vc on the top of the stack
    func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController {
            return navigationController.viewControllers.last!
        } else {
            return viewController
        }
    }
}
