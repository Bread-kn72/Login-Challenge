//
//  SecondViewController.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: - properties
    private let secondView = SecondView()
    
    private var email: String?
    private var password: String?
    
    // MARK: - life cycle
    init(email: String? = nil, password: String? = nil) {
        self.email = email
        self.password = password
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = secondView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAddTarget()
    }
    
    // MARK: - methods
    private func configureAddTarget() {
        secondView.mcButton.addTarget(self, action: #selector (mcButtonTapped), for: .touchUpInside)
    }
    
    @objc private func mcButtonTapped() {
        if let email = email, !email.isEmpty, let password = password, !password.isEmpty {
            CoreDataMethods.shared.deleteData(email: email, password: password)
            self.dismiss(animated: true)
        }
    }
}
