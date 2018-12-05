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

class FirestoreManager {
    private let db = Firestore.firestore()
    
    private let productsReference = "Products"
    
    func saveProduct(_ product: Product) {
        guard let dictionary = product.dictionary else { return }
        
        let ref: DocumentReference = db.collection(productsReference).document()
        ref.setData(dictionary)
    }
    
    func getProducts() -> Observable<[Product]> {
        return db.collection(productsReference).rx
                .getDocuments()
                .map({ (snapshot) -> [Product] in
                    return snapshot.documents.compactMap { Product(from: $0.data()) }
                })
        
    }
}
