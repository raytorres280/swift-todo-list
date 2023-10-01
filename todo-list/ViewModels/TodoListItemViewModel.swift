//
//  TodoListItemViewModel.swift
//  todo-list
//
//  Created by raymondtorres on 10/1/23.
//

import SwiftUI

class TodoListItemViewModel: ObservableObject {
    var categories :[String] = ["groceries", "tasks", "appointments"]
    @Published var title :String = ""
    @Published var selectedCategory :Todo.Categories?
}
