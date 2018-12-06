//
//  CALayer+Shadow.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 06/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

extension CALayer {
    func addShadow(with color: UIColor, at offset: CGSize, opacity: Float = 0.2) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOffset = offset
        shadowOpacity = opacity
    }
    
    func addShadow(with color: UIColor,
                   alpha: Float = 1.0,
                   xOffset: CGFloat = 0,
                   yOffset: CGFloat = 0,
                   blur: CGFloat = 0,
                   spread: CGFloat = 0) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOffset = CGSize(width: xOffset, height: yOffset)
        shadowRadius = blur / 2.0
        shadowOpacity = alpha
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        }
    }
    
    func removeShadow() {
        shadowPath = nil
        shadowColor = UIColor.clear.cgColor
        shadowRadius = 0
        shadowOpacity = 0
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = opacity
        shadowOffset = offSet
        shadowRadius = radius
        
        shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
