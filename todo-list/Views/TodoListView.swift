//
//  TodoListView.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        NavigationStack {
            VStack {
                 
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button {
//                    viewModel.newItemViewVisible = true
                    viewModel.newItemViewVisible = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.newItemViewVisible) {
                NewListItemView()
            }
        }
    }
}

#Preview {
    TodoListView()
}
