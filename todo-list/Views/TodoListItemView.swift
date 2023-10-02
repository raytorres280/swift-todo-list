//
//  TodoListItemsView.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import SwiftUI

struct TodoListItemView: View {
    @ObservedObject var viewModel: TodoListItemViewModel
    init(todo: Todo?) {
        viewModel = TodoListItemViewModel(todo: todo)
    }
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
            Form {
                TextField("Title", text: $viewModel.title)
            }
        }
    }
}

#Preview {
    TodoListItemView(todo: nil)
}
