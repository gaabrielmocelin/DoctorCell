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
    
    var query = PublishSubject<String>()
    var products: Observable<[Product]>
    let fetchProducts: Action<Void, [Product]>
    
    required init(coordinator: SceneCoordinatorProtocol, firestore: FirestoreProductsProtocol) {
        self.coordinator = coordinator
        self.firestore = firestore
        
        fetchProducts = Action(workFactory: { firestore.getProducts() })
        let allProducts = firestore.getProducts().concat(fetchProducts.elements)
        
        let filteredProducts =
                query
                .throttle(0.5, scheduler: MainScheduler.instance)
                .distinctUntilChanged()
                .map { $0.lowercased() }
                .flatMapLatest { query in
                    query.isEmpty ? allProducts : allProducts.map { $0.filter { $0.name.lowercased().contains(query) } }
                }
        
        products = Observable.merge(allProducts, filteredProducts)
    }
}
