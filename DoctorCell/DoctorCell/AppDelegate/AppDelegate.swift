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
        FirebaseConfigurator.start()
        setupWindow()
        setupInitialScene()
        AppearanceHelper.setupNavigationBarAppearance()
        return true
    }
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
    
    func setupInitialScene() {
        let coordinator = SceneCoordinator(window: window!)
        
        let productsViewModel = ProductsViewModel(coordinator: coordinator, firestore: FirestoreManager())
        coordinator.transition(to: .products(productsViewModel), type: .root)
    }
}
