//
//  SelectPersonTableViewCellViewModel.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import Foundation

class SelectPersonTableViewCellViewModel {
    // MARK: - Variables
    var person: Person
    var isSelected: Bool = false 
    
    // MARK: - Methods
    func configure(view: SelectPersonTableViewCell) {
        view.ageLabel.text = "\(person.age) years"
        view.nameLabel.text = person.name
        view.isSelectedView.backgroundColor = isSelected ? .yellow : .white
    }
    
    // MARK: - Lifecycle
    init(person: Person) {
        self.person = person
    }
}
