//
//  ProductCollectionViewCell.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 05/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let shadowView = UIView()
    let cornerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    func setup(with product: Product) {
        nameLabel.text = product.name
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        if let priceString = currencyFormatter.string(from: NSNumber(value: product.price)) {
            priceLabel.text = priceString
        } else {
            priceLabel.text = " -- "
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCollectionViewCell: ViewConfigurator {
    func buildViewHierarchy() {
        addSubview(shadowView)
        addSubview(cornerView)
        cornerView.addSubview(imageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
    }
    
    func setupConstraints() {
        shadowView.equalConstraintsTo(view: self, constant: 3)
        cornerView.equalConstraintsTo(view: shadowView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: cornerView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: cornerView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cornerView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: cornerView.heightAnchor, multiplier: 0.7).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 10).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    }
    
    func configureViews() {
        layer.shouldRasterize = true
        layer.masksToBounds = false
        cornerView.layer.cornerRadius = 8
        cornerView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
    }
    
    override func layoutSubviews() {
        shadowView.layer.addShadow(with: .black, alpha: 0.2, xOffset: 0, yOffset: 0, blur: 6)
    }
}
