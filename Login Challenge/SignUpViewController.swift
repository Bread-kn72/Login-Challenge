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
        
        configureAddTarget()
    }
    
    // MARK: - methods
    func configureAddTarget() {
        signUpView.signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
    }
    
    @objc func tappedSignUpButton() {
        if let email = signUpView.emailTextField.text, !email.isEmpty,
               let password = signUpView.passwordTextField.text, !password.isEmpty {
            print("email: \(email), password: \(password)")
            CoreDataMethods.shared.createData(email: email, password: password)
        } else {
            print("Email이나 비밀번호가 입력되지 않았습니다.")
            
            let alert = UIAlertController(title: "Error", message: "Email과 비밀번호를 모두 입력하세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        self.dismiss(animated: true)
    }
}
