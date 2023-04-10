//
//  LoginViewModel.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation


// individual@plana.ae

class LoginViewModel : LoginViewModelDelegate{
    
    

  
    

   
    var user: Observable<User?> =  Observable<User?>(nil)
    
    var errorObservable: Observable<CustomError?> = Observable<CustomError?>(nil)
    
    var loginUseCase: LoginUseCaseDelegate?
    
    func executeLogin(username: String, password: String) async {
        
        guard let result  = await loginUseCase?.startLogin(userEmail: username, password: password) else{
            return
        }
    
        switch result{
        case .success(let user):
            self.user.value = user
        case .failure(let error):
            errorObservable.value = error
      
        }
    }
    
    func executeSignInUsingGoogle() {
        loginUseCase?.startSigninUsingGoolge()
    }
    
    
    
    func executeSignInUsingFacebook() {
        loginUseCase?.startSigninUsingFacebook()
    }
    
    func executeSignInUsingApple() {
        loginUseCase?.startSigninUsingApple()
    }
    
    
    func executeIsUserLoagedIn() -> Bool {
        return loginUseCase?.startIsUserLogedin() ?? false
    }
    
    func executeGetSigninMethod() -> String? {
        return loginUseCase?.satrtGetSigninMethod()
    }
    
    
    func setOnSigninSuccessBundel(callback: @escaping (User) -> Void) {
        loginUseCase?.setOnSigninSuccessBundel(callback: callback)
    }
    
    
    
}
