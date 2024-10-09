//
//  View.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//

import UIKit
import SnapKit
import Then

final class MainView: UIView {
    
    // MARK: - properties
    private let mainTextLabel = UILabel().then {
        $0.text = "Welcome to Login Challenge"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .center
    }
    
    private let emailTextLabel = UILabel().then {
        $0.text = "Email"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
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
        $0.text = "Password"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "Enter your password"
        $0.isSecureTextEntry = true
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.keyboardType = .emailAddress
        $0.returnKeyType = .done
    }
    
    let loginbutton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    let signupButton = UIButton().then {
        $0.setTitle("SignUp", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .green
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    // MARK: - life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - methods
    func configureUI() {
        self.backgroundColor = .white
    }
    
    func configureHierarchy() {
        [mainTextLabel, signupButton, emailTextLabel, emailTextField, passwordTextLabel, passwordTextField, loginbutton].forEach {
            self.addSubview($0)
        }
    }
    
    func configureConstraints() {
        mainTextLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(80)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
        
        
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalTo(mainTextLabel.snp.bottom).offset(120)
            $0.height.equalTo(25)
            $0.centerX.equalTo(mainTextLabel)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(10)
            $0.height.equalTo(40)
            $0.centerX.equalTo(mainTextLabel)
            $0.horizontalEdges.equalTo(loginbutton)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(30)
            $0.height.equalTo(25)
            $0.centerX.equalTo(mainTextLabel)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(10)
            $0.height.equalTo(40)
            $0.centerX.equalTo(mainTextLabel)
            $0.horizontalEdges.equalTo(loginbutton)
        }
        
        loginbutton.snp.makeConstraints {
            $0.bottom.equalTo(passwordTextField.snp.bottom).offset(100)
            $0.height.equalTo(40)
            $0.horizontalEdges.equalToSuperview().inset(50)
            $0.centerX.equalTo(mainTextLabel)
        }
        
        signupButton.snp.makeConstraints {
            $0.horizontalEdges.equalTo(loginbutton)
            $0.top.equalTo(loginbutton.snp.bottom).offset(20)
            $0.height.equalTo(loginbutton)
            $0.centerX.equalTo(mainTextLabel)
        }
    }
}
