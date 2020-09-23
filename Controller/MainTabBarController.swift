//
//  MainTabBarController.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private let authService: AuthService = AuthService()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService.isUserConnected { isConnected in
            if !isConnected {
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Authentification", bundle: nil)
                    let signInViewController = storyboard.instantiateViewController(identifier: "SignInViewController")
                    signInViewController.modalPresentationStyle = .fullScreen
                    self.present(signInViewController, animated: true)
                }
            }
        }
    }
}
