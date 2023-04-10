//
//  EmailPasswordAuth.swift
//  appDemo
//
//  Created by youssef osama on 16/01/1402 AP.
//


import FirebaseAuth
import Foundation

class EmailPasswordAuth {
    func login(email: String, password: String) -> Bool {
        
        /*
        Auth.auth().createUser(withEmail: emailField.text ?? "tazosama33@gmail.com", password: passwordField.text ?? "123456") { authResult, error in
            print(authResult)
            print(error)
          // ...
        }
         
         
        
        Auth.auth().signIn(withEmail: emailField.text ?? "tazosama33@gmail.com", password: passwordField.text ?? "1234567890") { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            print("signin cluser")
            print(authResult?.user.email)
            
            print("cluser error")
            print(error)
        }
         */
        
     return true
    }
    
    func logout() -> Bool {
        return true
    }
    
    func createAccount(email: String, password: String) -> Bool {
        return true
    }
    
    func listenForAuth() -> AuthStateDidChangeListenerHandle {
        
        return Auth.auth().addStateDidChangeListener { auth, user in
            print("Auth")
            print(auth)
            print("User")
            print(user?.email)
         }
    }
    
    
}
