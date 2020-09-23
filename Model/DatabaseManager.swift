//
//  DatabaseManager.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import Foundation

final class DatabaseManager {
    
    // MARK: - Properties
    
    private let database: DatabaseType
    
    // MARK: - Initialization
    
    init(database: DatabaseType = FirebaseDatabase()) {
        self.database = database
    }
    
    // MARK: - Read Queries
    
    func getUserData(with uid: String, callback: @escaping (Result<[String: Any], Error>) -> Void) {
        database.getUserData(with: uid, callback: callback)
    }
}
