//
//  AppearanceHelper.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 03/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit

struct AppearanceHelper {
    static func setupNavigationBarAppearance() {
        let appearence = UINavigationBar.appearance()
        appearence.prefersLargeTitles = true
        appearence.tintColor = .black
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        //translucent
        appearence.isTranslucent = true
        appearence.setBackgroundImage(UIImage(), for: .default)
    }
}
