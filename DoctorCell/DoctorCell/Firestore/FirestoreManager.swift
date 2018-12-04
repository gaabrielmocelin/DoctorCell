//
//  FirestoreManager.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    let db = Firestore.firestore()
    
    func saveProduct(_ product: Product) {
        guard let dictionary = product.dictionary else { return }
        
        let ref: DocumentReference = db.collection("Products").document()
        ref.setData(dictionary)
    }
}
