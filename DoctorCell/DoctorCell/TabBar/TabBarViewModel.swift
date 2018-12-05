//
//  TabBarViewModel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

class TabBarViewModel: ViewModelProtocol {
    var coordinator: SceneCoordinatorProtocol
    var tabCoordinator: TabBarCoordinator
    
    var productsViewModel: ProductsViewModel
    
    required init(coordinator: TabBarCoordinator) {
        self.coordinator = coordinator
        self.tabCoordinator = coordinator
        
        let firestore = FirestoreManager()
        productsViewModel = ProductsViewModel(coordinator: coordinator, firestore: firestore)
    }
}
