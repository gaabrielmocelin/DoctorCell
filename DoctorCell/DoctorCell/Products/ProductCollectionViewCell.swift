//
//  ProductCollectionViewCell.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 05/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCollectionViewCell: ViewConfigurator {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        backgroundColor = UIColor.gray
    }
}
