//
//  SelectionStatusViewController.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import UIKit

class SelectionStatusViewController: UIViewController {

    var success: Bool
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        return label
    }()
    
    init(success: Bool) {
        self.success = success
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        markup()
    }
    
    private func markup() {
        view.backgroundColor = success ? .green : .red
        
        [statusLabel].forEach { view.addSubview($0) }
        
        statusLabel.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
}
