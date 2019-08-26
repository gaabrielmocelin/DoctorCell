//
//  ViewModelProtocol.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 30/11/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation
import Action
import RxSwift

protocol ViewModelProtocol {
    var coordinator: SceneCoordinatorProtocol { get }
}
