//
//  ViewConfigurator.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 05/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

protocol ViewConfigurator {
    func setupViewConfiguration()
    func buildViewHierarchy()
    func configureViews()
    func setupConstraints()
}

extension ViewConfigurator {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}
}
