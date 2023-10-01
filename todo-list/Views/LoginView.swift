//
//  LoginView.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        VStack {
            // Login with google btn
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.teal)
                    .rotationEffect(.degrees(30))
                VStack {
                    Text("Todo List")
                        .foregroundColor(.white)
                    Text("Get things done")
                    GoogleSignInButton()
                            .padding()
                            .onTapGesture {
                                appViewModel.signIn()
                            }
                }
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: 300)
//            .offset(y: -100)
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
