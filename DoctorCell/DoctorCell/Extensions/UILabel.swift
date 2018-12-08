//
//  UILabel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 07/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(fontSize: CGFloat, weight: UIFont.Weight) {
        self.init()
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
}
