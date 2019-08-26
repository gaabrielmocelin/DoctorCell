//
//  ProductDetailViewModel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

final class ProductDetailViewModel: ViewModelProtocol {
    let coordinator: SceneCoordinatorProtocol
    let product: Product
    
    init(coordinator: SceneCoordinatorProtocol, product: Product) {
        self.coordinator = coordinator
        self.product = product
    }
}
