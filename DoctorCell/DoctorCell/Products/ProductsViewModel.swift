//
//  ProductsViewModel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation
import RxSwift

final class ProductsViewModel: ViewModelProtocol {
    let coordinator: SceneCoordinatorProtocol
    private let firestore: FirestoreManager
    
    required init(coordinator: SceneCoordinatorProtocol, firestore: FirestoreManager) {
        self.coordinator = coordinator
        self.firestore = firestore
    }
    
    lazy var products: Observable<[Product]> = {
        firestore.getProducts()
    }()
}
