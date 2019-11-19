//
//  SelectPersonTableViewCell.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import UIKit

class SelectPersonTableViewCell: UITableViewCell {
    // MARK: - Variables
    var viewModel: SelectPersonTableViewCellViewModel! {
        didSet {
            viewModel.configure(view: self)
        }
    }
    
    // MARK: - Outlets
    var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        return label
    }()
    
    var isSelectedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 4
        
        return view
    }()
    
    // MARK: - Actions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.viewModel.isSelected = selected
        self.isSelectedView.backgroundColor = selected ? .yellow : .white
    }
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        markup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Markup
    private func markup() {
        contentView.backgroundColor = .white
        
        [nameLabel, ageLabel, isSelectedView].forEach { contentView.addSubview($0) }
        
        nameLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(12)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
        }
        
        ageLabel.snp.makeConstraints() {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-12)
        }
        
        isSelectedView.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.size.equalTo(CGSize(width: 30, height: 30))
        }
    }
}
