//
//  AuthFirebase.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import Firebase
import Foundation

protocol AuthType {
    var currentUID: String? { get }
    func signIn(email: String, password: String, callback: @escaping (Bool) -> Void)
    func signUp(userName: String, email: String, password: String, callback: @escaping (Bool) -> Void)
    func signOut(callback: @escaping (Bool) -> Void)
    func isUserConnected(callback: @escaping (Bool) -> Void)
}

final class AuthFirebase: AuthType {
    
    // MARK: - Properties
    
    var currentUID: String? {
        return Auth.auth().currentUser?.uid
    }
    
    // MARK: - Auth Methods
    
    func signIn(email: String, password: String, callback: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            
            guard (authDataResult != nil), error == nil else {
                callback(false)
                return
            }
            callback(true)
        }
    }
    
    func signUp(userName: String, email: String, password: String, callback: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            guard let authDataResult = authDataResult, error == nil else {
                callback(false)
                return
            }
            let userInfo: [String: Any] = ["uid": authDataResult.user.uid, "username": userName]
            Firestore.firestore().collection("users").addDocument(data: userInfo)
            callback(true)
        }
    }
    
    func signOut(callback: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            callback(true)
        } catch {
            callback(false)
        }
    }
    
    func isUserConnected(callback: @escaping (Bool) -> Void) {
        _ = Auth.auth().addStateDidChangeListener { _, user in
            guard (user != nil) else {
                callback(false)
                return
            }
            callback(true)
        }
    }
}
