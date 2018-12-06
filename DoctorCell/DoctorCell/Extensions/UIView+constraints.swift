//
//  UIView+constraints.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 06/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

extension UIView {
    func equalConstraintsTo(view: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        let bottomConstraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant)
        let leadingConstraint = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant)
        let trailingConstraint = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
}
