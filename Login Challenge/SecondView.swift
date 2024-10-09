//
//  SecondView.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//

import UIKit
import SnapKit
import Then

final class SecondView: UIView {
    
    // MARK: - properties
    let mainTextLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .center
    }
    
    let mcButton = UIButton().then {
        $0.setTitle("Member Cancel", for: .normal)
        $0.backgroundColor = .red
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
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
        [mainTextLabel, mcButton].forEach {
            self.addSubview($0)
        }
    }
    
    func configureConstraints() {
        mainTextLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
        
        mcButton.snp.makeConstraints {
            $0.top.equalTo(mainTextLabel.snp.bottom).offset(50)
            $0.height.equalTo(100)
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.centerX.equalTo(mainTextLabel)
        }
    }
}
