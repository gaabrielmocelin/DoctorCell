//
//  SceneController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation
protocol SceneControllerProtocol {
    associatedtype T: ViewModelProtocol
    var viewModel: T {get}
    
    init(viewModel: T)
}
