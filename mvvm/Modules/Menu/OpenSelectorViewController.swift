//
//  OpenSelectorViewController.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import UIKit

class OpenSelectorViewController: UIViewController {
    // MARK: - Variables
    
    // MARK: - Outlet
    lazy var pushButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        
        return button
    }()
    
    lazy var presentButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(prsnt), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Actions
    @objc private func push() {
        let router = SelectPersonRouter()
        router.present(.push, on: self)
    }
    
    @objc private func prsnt() {
        let router = SelectPersonRouter()
        router.present(.present, on: self)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        markup()
    }
    
    // MARK: - Markup
    private func markup() {
        view.backgroundColor = .white
        
        [pushButton, presentButton].forEach { view.addSubview($0) }
        
        pushButton.snp.makeConstraints() {
            $0.size.equalTo(CGSize(width: 120, height: 60))
            $0.top.equalToSuperview().offset(48)
            $0.centerX.equalToSuperview()
        }
        
        presentButton.snp.makeConstraints() {
            $0.size.equalTo(CGSize(width: 120, height: 60))
            $0.top.equalTo(pushButton.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
}
