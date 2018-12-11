//
//  LoginViewController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 11/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginViewController: SceneControllerProtocol {
    typealias T = LoginViewModel
}
