//
//  AppDelegate.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        setupInitialScene()
        setupNavigationBarAppearance()
        return true
    }
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
    
    func setupInitialScene() {
        let coordinator = SceneCoordinator(window: window!)
        let productsViewModel = ProductsViewModel(coordinator: coordinator)
        coordinator.transition(to: .products(productsViewModel), type: .root)
    }
    
    func setupNavigationBarAppearance() {
        let appearence = UINavigationBar.appearance()
        appearence.prefersLargeTitles = true
        appearence.tintColor = .black
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        //translucent
        appearence.isTranslucent = true
        appearence.setBackgroundImage(UIImage(), for: .default)
    }
}

