//
//  LoginViewController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 11/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit
import RxSwift

final class LoginViewController: UIViewController {
    var viewModel: LoginViewModel
    
    private var cancelButton = UIButton(frame: .zero)
    private var loginButton = UIButton(frame: .zero)
    private let userNameTextField = UITextField(frame: .zero)
    private let passwordTextField = UITextField(frame: .zero)
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Administrador"
        setupViewConfiguration()
        addButtonsActions()
        listenToTextFields()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonsActions() {
        cancelButton.rx.action = viewModel.dismissAction
    }
    
    func listenToTextFields() {
        let username = userNameTextField.rx.text.orEmpty.asObservable()
        let password = passwordTextField.rx.text.orEmpty.asObservable()
        
        let loginRequest = Observable.combineLatest(username, password)
        
        loginButton.rx.bind(to: viewModel.loginAction, input: loginRequest)
    }
}

extension LoginViewController: SceneControllerProtocol {
    typealias T = LoginViewModel
}

extension LoginViewController: ViewConfigurator {
    func buildViewHierarchy() {
        view.addSubview(cancelButton)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    func setupConstraints() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 25).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func configureViews() {
        cancelButton.setTitle("EXIT", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        
        userNameTextField.placeholder = "Email"
        passwordTextField.placeholder = "Senha"
    }
}
