//
//  Person.swift
//  mvvm
//
//  Created by erumaru on 11/19/19.
//  Copyright © 2019 kbtu. All rights reserved.
//

import Foundation

class Person {
    // MARK: - Variables
    var name: String
    var age: Int
    
    // MARK: - Lifecycle
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
