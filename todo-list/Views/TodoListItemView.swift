//
//  TodoListItemsView.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewModel()
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
    TodoListItemView()
}
