//
//  ProductsViewModel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation
import RxSwift
import Action

final class ProductsViewModel: ViewModelProtocol {
    let coordinator: SceneCoordinatorProtocol
    private let firestore: FirestoreProductsProtocol
    
    var products: Observable<[Product]>
    let fetchProducts: Action<Void, [Product]>
    
    required init(coordinator: SceneCoordinatorProtocol, firestore: FirestoreProductsProtocol) {
        self.coordinator = coordinator
        self.firestore = firestore
        
        fetchProducts = Action(workFactory: { firestore.getProducts() })
        products = firestore.getProducts().concat(fetchProducts.elements)
    }
}
