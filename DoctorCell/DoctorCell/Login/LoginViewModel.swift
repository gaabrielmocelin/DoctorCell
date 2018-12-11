//
//  LoginViewModel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 11/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

final class LoginViewModel: ViewModelProtocol {
    var coordinator: SceneCoordinatorProtocol
    
    init(coordinator: SceneCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
