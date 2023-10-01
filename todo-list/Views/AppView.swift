//
//  ContentView.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import SwiftUI
import FirebaseCore

struct AppView: View {
    @StateObject var viewModel = AppViewModel()
//    @ObservedObject var isSignedIn = viewModel.$signInState
    init() {
        FirebaseApp.configure()
        print("firebase configured")
    }
    
//    func isLoggedin
    @ViewBuilder
    var entryPoint: some View {
        VStack {
            TabView {
                TodoListView()
                    .tabItem {
                        Label("Todos", systemImage: "plus")
                    }
    //                .environmentObject(viewModel)
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "plusx`")
                    }
                
            }
        }
        .padding()
    }
    
    var body: some View {
//        Spacer()
        switch viewModel.signInState {
        case .signedIn:
            entryPoint
                .environmentObject(viewModel)
        default:
//            LoginView()
            entryPoint
                .environmentObject(viewModel)
        }
//            .modifier(LoginViewModifier(signInState: viewModel.signInState))
    }
}

//struct LoginViewModifier: ViewModifier {
//    let isLoggedIn: Bool
//    init(signInState: AppViewModel.SignInState) {
//        isLoggedIn = signInState == AppViewModel.SignInState.signedIn ? true : false
//    }
//    func body(content: Content) -> some View {
//        Group {
//            if !isLoggedIn {
//                LoginView(appViewModel: viewModel)
//            } else {
//                content
//            }
//        }
//    }
//}

#Preview {
    AppView()
}
