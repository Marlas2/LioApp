//
//  FirebaseDatabase.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import Foundation
import Firebase

enum NetworkError: Error {
       case noData, incorrectResponse, undecodable
   }

protocol DatabaseType {
    func getUserData(with uid: String, callback: @escaping (Result<[String: Any], Error>) -> Void)
}

final class FirebaseDatabase: DatabaseType {
    
    // MARK: - Read Queries
    
    func getUserData(with uid: String, callback: @escaping (Result<[String : Any], Error>) -> Void) {
        Firestore.firestore().collection("users").whereField("uid", isEqualTo: uid).getDocuments { querySnapshot, error in
            guard let data = querySnapshot?.documents.first?.data() else {
                callback(.failure(NetworkError.noData))
                return
            }
            callback(.success(data))
        }
    }
    
}
