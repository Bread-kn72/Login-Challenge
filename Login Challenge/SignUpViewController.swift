//
//  SignUpViewController.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: - properties
    private let signUpView = SignUpView()
    
    // MARK: - life cycle
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - methods
    func configureAddTarget() {
        signUpView.signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
    }
    
    @objc func tappedSignUpButton() {
        if let email = signUpView.emailTextField.text, let password = signUpView.passwordTextField.text {
            print("email: \(email), password: \(password)")
            CoreDataMethods.shared.createData(email: email, password: password)
        }
        
        self.dismiss(animated: true)
    }
}
