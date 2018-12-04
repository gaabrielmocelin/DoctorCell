//
//  FirebaseConfigure.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 04/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Firebase

struct FirebaseConfigurator {
    static func start() {
        FirebaseApp.configure()
    }
}
