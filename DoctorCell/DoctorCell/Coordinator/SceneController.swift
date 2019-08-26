//
//  SceneController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

protocol SceneControllerProtocol {
    associatedtype T: ViewModelProtocol
    var viewModel: T {get}
    
    init(viewModel: T)
}

extension SceneControllerProtocol where Self: UIViewController {
    func popped() {
        viewModel.coordinator.didPop()
    }
}
