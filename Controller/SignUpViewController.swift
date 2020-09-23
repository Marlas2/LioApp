//
//  SignUpViewController.swift
//  LioApp
//
//  Created by Quentin Marlas on 01/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import GeoFire
import UIKit
import Firebase

final class SignUpViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    
    private let authService: AuthService = AuthService()
    private let manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLocationManager()

    }
    
   private func configureLocationManager() {
    
    if #available(iOS 9.0, *) {
        manager.allowsBackgroundLocationUpdates = true
    } else {
        // Fallback on earlier versions
    }
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.distanceFilter = kCLDistanceFilterNone
    manager.pausesLocationUpdatesAutomatically = false
    manager.delegate = self
    manager.requestWhenInUseAuthorization()
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        userNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
    
        guard let userName = userNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        authService.signUp(userName: userName, email: email, password: password) { isSuccess in
            self.performSegue(withIdentifier: "UnwindToSignInViewController", sender: nil)
        }
    }
    
}
