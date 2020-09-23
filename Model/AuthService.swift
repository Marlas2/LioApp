//
//  AuthService.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import Firebase
import Foundation
import GeoFire

final class AuthService {
    
    // MARK: - Properties
    
    private let auth: AuthType
    var currentUID: String? { return auth.currentUID }
    
    // MARK: - Initializer
    
    init(auth: AuthType = AuthFirebase()) {
        self.auth = auth
    }
    
    // MARK: - Auth Methods
    
    func signIn(email: String, password: String, callback: @escaping (Bool) -> Void) {
        auth.signIn(email: email, password: password, callback: callback)
    }
    
    func signUp(userName: String, email: String, password: String, callback: @escaping (Bool) -> Void) {
        auth.signUp(userName: userName, email: email, password: password, callback: callback)
    }
    
    func signOut(callback: @escaping (Bool) -> Void) {
        auth.signOut(callback: callback)
    }
    
    func isUserConnected(callback: @escaping (Bool) -> Void) {
        auth.isUserConnected(callback: callback)
    }
}
