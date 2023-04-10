//
//  LoginViewModelDelegate.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation


    protocol LoginViewModelDelegate {
       // individual@plana.ae
        var loginUseCase: LoginUseCaseDelegate? { get set}
        
        var user  : Observable<User?> {get set}
        var errorObservable : Observable<CustomError?> {get set}
        func executeIsUserLoagedIn() -> Bool
        func executeLogin(username: String, password: String) async
        
        func executeSignInUsingGoogle()
        func executeSignInUsingFacebook()
        func executeSignInUsingApple()
        
        func executeGetSigninMethod() -> String?
        func setOnSigninSuccessBundel( callback: @escaping (_ user : User ) -> Void)
    }

