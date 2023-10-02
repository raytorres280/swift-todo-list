//
//  NewListItemView.swift
//  todo-list
//
//  Created by raymondtorres on 10/1/23.
//

import SwiftUI

struct NewListItemView: View {
    //TODO: this is wrong, should receive passed down one from parent
    @StateObject var viewModel = TodoListItemViewModel()
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
            Form {
                Section {
                    TextField("Title", text: $viewModel.title)
                }
                Section {
                    Picker("categories", selection: $viewModel.selectedCategory) {
                        ForEach(Todo.Categories.allCases, id: \.rawValue) { c in
                            Text(c.rawValue)
                        }
                    }.labelsHidden()
                }
                Button(action: viewModel.onSave) {
                    Text("Save")
                }
            }
            .padding(.top, 30)
        }.navigationTitle("testing").toolbar {
            ToolbarItem {
                Button {
                    print("press me")
    //                Text("cancel")
                } label: {
                    Text("cancel")
                }
                .background(.blue)
            }
//            .buttonStyle(.automatic)
        }
    }
}

#Preview {
    NewListItemView()
}
