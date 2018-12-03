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
    func setupBackNavigation() {
        var customBackButton = UIBarButtonItem(title: "<", style: .done, target: nil, action: nil)
        customBackButton.rx.action = viewModel.backAction()
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = customBackButton
    }
}
