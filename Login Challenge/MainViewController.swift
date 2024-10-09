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
        mainView.loginbutton.addTarget(self, action: #selector(checkMember), for: .touchUpInside)
    }
    
    @objc func checkMember() {
    }
    
    func tappedLoginButton() {
    }
}

