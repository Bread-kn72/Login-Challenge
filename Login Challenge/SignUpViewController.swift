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
    private func configureAddTarget() {
        signUpView.signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
    }
    
    private func configureDelegate() {
        signUpView.emailTextField.delegate = self
        signUpView.passwordTextField.delegate = self
    }
    
    @objc private func tappedSignUpButton() {
        if let email = signUpView.emailTextField.text, !email.isEmpty,
               let password = signUpView.passwordTextField.text, !password.isEmpty {
            if isEmailExisting(email: email) {
                    let alert = UIAlertController(title: "Error", message: "이미 존재하는 Email입니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true, completion: nil)
                    return
                }
            
            print("email: \(email), password: \(password)")
            CoreDataMethods.shared.createData(email: email, password: password)
        } else {
            print("Email이나 비밀번호가 입력되지 않았습니다.")
            
            let alert = UIAlertController(title: "Error", message: "Email과 비밀번호를 모두 입력하세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
        
        self.dismiss(animated: true)
    }
    
    private func isEmailExisting(email: String) -> Bool {
        let fetchRequest = MI.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)

        do {
            let results = try CoreDataMethods.shared.container.viewContext.fetch(fetchRequest)
            return !results.isEmpty
        } catch {
            print("이메일 중복 체크 실패: \(error.localizedDescription)")
            return false
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == signUpView.emailTextField {
            signUpView.passwordTextField.becomeFirstResponder()
        } else if textField == signUpView.passwordTextField {
            textField.resignFirstResponder()
            self.tappedSignUpButton()
        }
        return true
    }
}
