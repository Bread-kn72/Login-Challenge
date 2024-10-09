//
//  ViewController.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//

import UIKit
import CoreData

final class MainViewController: UIViewController {
    
    // MARK: - properties
    private let mainView = MainView()
    
    // MARK: - life cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddTarget()
    }
    
    // MARK: - methods
    func configureAddTarget() {
        mainView.loginbutton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        mainView.signupButton.addTarget(self, action: #selector (tappedSignUpButton), for: .touchUpInside)
    }
    
    @objc func tappedLoginButton() {
        guard let email = mainView.emailTextField.text, !email.isEmpty,
              let password = mainView.passwordTextField.text, !password.isEmpty else {
            print("Email과 비밀번호를 입력해주세요.")
            return
        }
        
        let fetchRequest = MI.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        
        do {
            let result = try CoreDataMethods.shared.container.viewContext.fetch(fetchRequest)
            
            if !result.isEmpty {
                print("로그인 성공")
                present(SecondViewController(email: email, password: password), animated: true)
            } else {
                print("이메일 또는 비밀번호가 잘못되었습니다.")
                let alert = UIAlertController(title: "로그인 실패", message: "이메일 또는 비밀번호가 잘못되었습니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                present(alert, animated: true)
            }
            
        } catch {
            print("데이터 읽기 실패: \(error.localizedDescription)")
        }
    }
    
    @objc func tappedSignUpButton() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .automatic
        present(signUpVC, animated: true)
    }
}

