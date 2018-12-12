//
//  LoginViewModel.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 11/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation
import RxSwift
import Action

final class LoginViewModel: ViewModelProtocol {
    typealias LoginRequest = Observable<(String, String)>
    
    var coordinator: SceneCoordinatorProtocol
    
    var loginRequest = PublishSubject<LoginRequest>()
    
    var dismissAction: CocoaAction
    
    init(coordinator: SceneCoordinatorProtocol) {
        self.coordinator = coordinator
        
        dismissAction = CocoaAction {
            coordinator.pop(animated: true)
            return Observable.empty()
        }
    }
    
    lazy var loginAction: Action<LoginRequest,Bool> = {
        return Action<Observable<(String, String)>,Bool> { request in
            return request.map { $0.0 == "teste" }.take(1)
        }
    }()
}
