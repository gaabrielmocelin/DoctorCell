//
//  ProductsViewModel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

final class ProductsViewModel: ViewModelProtocol {
    let coordinator: SceneCoordinatorProtocol
    
    required init(coordinator: SceneCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
