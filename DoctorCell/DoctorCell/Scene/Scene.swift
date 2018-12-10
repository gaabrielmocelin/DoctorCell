//
//  Scene.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

enum Scene {
    case tabBar(TabBarViewModel)
    case products(ProductsViewModel)
    case productDetail(ProductDetailViewModel)
}
