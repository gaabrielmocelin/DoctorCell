//
//  ContainerProductsView.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 05/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit
import RxSwift

final class ContainerProductsView: UIView {
    let disposeBag = DisposeBag()
    
    lazy var collectionView: UICollectionView = {
        let layout = generateCollectionViewLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.register(type: ProductCollectionViewCell.self)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setupViewConfiguration()
    }

    func generateCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        return layout
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContainerProductsView: ViewConfigurator {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func configureViews() {
        backgroundColor = UIColor.green
        collectionView.backgroundColor = UIColor.brown
    }
}
