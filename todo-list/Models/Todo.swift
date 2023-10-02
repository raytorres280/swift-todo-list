//
//  Todo.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import Foundation

struct Todo {
    enum Categories: String, CaseIterable {
        case groceries
        case tasks
        case appointments
    }
    
    var id: Int
    var title: String
    var category: Categories
    var isComplete :Bool
    var userName: String
    var userEmail: String
}
