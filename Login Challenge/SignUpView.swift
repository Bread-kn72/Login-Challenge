//
//  SignUpView.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//

import UIKit
import SnapKit
import Then

final class SignUpView: UIView {
    
    // MARK: - properties
    private let emailTextLabel = UILabel().then {
        $0.text = "Email"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .label
    }
    
    let emailTextField = UITextField().then {
        $0.placeholder = "Enter your email"
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.keyboardType = .emailAddress
        $0.returnKeyType = .next
    }
    
    private let passwordTextLabel = UILabel().then {
        $0.text = "password"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .label
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "Enter your password"
        $0.isSecureTextEntry = true
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.returnKeyType = .done
    }
    
    let signUpButton = UIButton().then {
        $0.setTitle("Sign Up", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    // MARK: - life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - methods
    func configureUI() {
        self.backgroundColor = .white
    }
    
    func configureHierarchy() {
        [emailTextLabel, emailTextField, passwordTextLabel, passwordTextField, signUpButton].forEach {
            self.addSubview($0)
        }
    }
    
    func configureConstraints() {
        emailTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(emailTextLabel)
            $0.height.equalTo(emailTextLabel)
            $0.centerX.equalToSuperview()
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.horizontalEdges.equalTo(emailTextLabel)
            $0.height.equalTo(emailTextLabel)
            $0.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(emailTextLabel)
            $0.height.equalTo(emailTextLabel)
            $0.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
            $0.horizontalEdges.equalTo(emailTextLabel)
            $0.height.equalTo(emailTextLabel)
            $0.centerX.equalToSuperview()
        }
    }
}
