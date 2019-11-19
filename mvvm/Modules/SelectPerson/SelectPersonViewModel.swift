//
//  SelectPersonViewModel.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import Foundation

class SelectPersonViewModel {
    // MARK: - Variables
    var router: SelectPersonRouter
    var persons: [Person] = [.init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30), .init(name: "Abzal", age: 24), .init(name: "Vasya", age: 15), .init(name: "Aliya", age: 30)]
    var cellViewModel: [SelectPersonTableViewCellViewModel]
    var allowMultipleSelection: Bool
    
    // MARK: - Methods
    func finish() {
        router.close()
        router.enqueRoute(.success)
    }
    
    // MARK: - Lifecycle
    init(router: SelectPersonRouter, allowMultipleSelection: Bool) {
        self.router = router
        self.allowMultipleSelection = allowMultipleSelection
        cellViewModel = persons.map { SelectPersonTableViewCellViewModel(person: $0) }
    }
}
