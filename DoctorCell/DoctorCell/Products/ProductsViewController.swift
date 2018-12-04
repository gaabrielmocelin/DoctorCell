//
//  ViewController.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

final class ProductsViewController: UIViewController {
    var viewModel: ProductsViewModel
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setTitle("secondVC", for: .normal)
        return button
    }()
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button.addTarget(self, action: #selector(openDetailVC), for: .touchUpInside)
    }
    
     @objc func openDetailVC() {
        let productvm = ProductDetailViewModel(coordinator: self.viewModel.coordinator)
        self.viewModel.coordinator.transition(to: .productDetail(productvm), type: .push)
    }
}

extension ProductsViewController: SceneControllerProtocol {}

