//
//  FirestoreManager.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation
import FirebaseFirestore
import RxSwift
import RxSwiftExt

enum FirestoreError: Error {
    case nilDictionary
}

protocol FirestoreProductsProtocol {
    func getProducts() -> Observable<[Product]>
    func saveProduct(_ product: Product) -> Completable
}

class FirestoreManager {
    private let db = Firestore.firestore()
    private let productsReference = "Products"
}

extension FirestoreManager: FirestoreProductsProtocol {
    func saveProduct(_ product: Product) -> Completable {
        guard let id = product.id, let dictionary = product.dictionary else { return Completable.error(FirestoreError.nilDictionary) }
        
        return db.collection(productsReference)
                .document(id)
                .rx
                .setData(dictionary)
                .ignoreElements()
    }
    
    func getProducts() -> Observable<[Product]> {
        return db.collection(productsReference).rx
            .getDocuments()
            .map({ (snapshot) -> [Product] in
                return snapshot.documents.compactMap { Product(from: $0.data()) }
            })
    }
}
