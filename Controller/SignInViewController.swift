//
//  SignInViewController.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - Properties
    
    private let authService: AuthService = AuthService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        guard let login = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        authService.signIn(email: login, password: password) { isSuccess in
            if isSuccess {
                self.dismiss(animated: true)
            }
        }
    }
    @IBAction private func unwindToSignInViewController(_ segue: UIStoryboardSegue) { dismiss(animated: false)
    }
}
