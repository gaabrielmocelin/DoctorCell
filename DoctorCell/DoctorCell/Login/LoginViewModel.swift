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
    let disposeBag = DisposeBag()
    var coordinator: SceneCoordinatorProtocol
    
    var dismissAction: CocoaAction
    
    typealias LoginRequest = Observable<(String, String)>
    var loginAction: Action<LoginRequest,Bool>
    
    init(coordinator: SceneCoordinatorProtocol) {
        self.coordinator = coordinator
        
        dismissAction = CocoaAction {
            coordinator.dismiss(animated: true)
            return Observable.empty()
        }
        
        loginAction = Action<Observable<(String, String)>,Bool> { request in
            return request.map { $0.0 == "teste" }.take(1)
        }
        
        loginAction.elements.debug().subscribe().disposed(by: disposeBag)
    }
}
