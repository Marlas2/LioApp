//
//  HomeViewController.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var userNameLabel: UILabel!
    
    // MARK: - Properties
    
    private let authService: AuthService = AuthService()
    private let dataBaseManager: DatabaseManager = DatabaseManager()
    
    // MARK: - Initialization
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindUI()
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        authService.signOut { isSuccess in
            if !isSuccess {
                // Present an alert
            }
        }
    }
    
    // MARK: - Methods
    
    private func bindUI() {
        guard let uid = authService.currentUID else { return }
        dataBaseManager.getUserData(with: uid) { [unowned self] result in
            switch result {
            case .success(let userData):
                guard let userName: String = userData["username"] as? String else { return }
                self.userNameLabel.text = userName
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
