//
//  Product.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: String?
    let name: String
    let price: Float
    let description: String?
    let imageURL: String?
}
