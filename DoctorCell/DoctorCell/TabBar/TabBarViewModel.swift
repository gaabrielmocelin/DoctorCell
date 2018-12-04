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
    
    var productsViewModel: ProductsViewModel
    
    required init(coordinator: SceneCoordinatorProtocol) {
        self.coordinator = coordinator
        
        productsViewModel = ProductsViewModel(coordinator: coordinator)
    }
}
