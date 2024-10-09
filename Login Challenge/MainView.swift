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
    
    let mainTextLabel = UILabel().then {
        $0.text = "Welcome to Login Challenge"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .center
    }
}
