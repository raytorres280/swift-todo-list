//
//  AppViewModel.swift
//  todo-list
//
//  Created by raymondtorres on 9/30/23.
//

import Foundation
import Firebase
import GoogleSignIn
import GoogleSignInSwift

class AppViewModel: ObservableObject {
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var signInState :SignInState = .signedOut
    @Published var email :String? = nil
    @Published var userProfilePhotoURL :String? = nil
//    @Published var user :GIDGoogleUser? = nil
    @Published var userIdToken :String? = nil
    
    func signIn() {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                print("authenticating previous user")
                authenticateUser(for: user, with: error)
            }
        } else {
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            print("does client ID work?")
            // 3
            let configuration = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = configuration
            // 4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            
            
            // 5
            print("signing in new user")
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
                authenticateUser(for: result?.user, with: error)
              }
        }
    }
    
    func signOut() {
      // 1
      GIDSignIn.sharedInstance.signOut()
      
      do {
        // 2
        try Auth.auth().signOut()
        signInState = .signedOut
      } catch {
        print(error.localizedDescription)
      }
    }
    
    func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        if let error = error {
            print("There is an error signing the user in ==> \(error)")
            return
        }
        guard let user = user, let idToken = user.idToken?.tokenString else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if error != nil {
                print(error)
            } else {
//                self.userProfilePhotoURL = authResult?.user.photoURL
//                self.userId = authResult?.user.uid
                self.email = authResult?.user.email
                self.userIdToken = authResult?.additionalUserInfo?.username
                self.signInState = .signedIn
            }
        }
    }
}
