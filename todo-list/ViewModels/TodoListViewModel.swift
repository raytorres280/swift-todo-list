//
//  TodoListViewModel.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import Foundation

class TodoListViewModel : ObservableObject {
    @Published var todos: Array = []
    @Published var newItemViewVisible: Bool = false
    init() {}
    
    func fetchTodos() {
        
    }
    
}
