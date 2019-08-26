//
//  ProductDetailViewController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    //properties
    var viewModel: ProductDetailViewModel
    
    //views
    lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Comprar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return button
    }()
    
    //functions
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            popped()
        }
    }
}

extension ProductDetailViewController: SceneControllerProtocol {}

extension ProductDetailViewController: ViewConfigurator {
    func buildViewHierarchy() {
        view.addSubview(buyButton)
    }
    
    func setupConstraints() {
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func configureViews() {
        navigationItem.title = viewModel.product.name
    }
}
