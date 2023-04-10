//
//  LoginUseCase.swift
//  Clean-MVVM
//
//  Created by youssef osama on 11/01/1402 AP.
//

import Foundation

class LoginUseCase : LoginUseCaseDelegate{
 
  
   

    
    var loginRespository: LoginRepositoryDelegate?
    
    
    
   
    
    func startLogin(userEmail: String, password: String) async -> Result<User , CustomError> {
        guard let res =  await loginRespository?.loginUser(userEmail: userEmail, password: password) else{
            return .failure(CustomError("ass"))
        }
        
    
        return res
                               
    }
    
    func startSigninUsingGoolge() {
        loginRespository?.signinUsingGoolge()
    }
    
    func startSigninUsingFacebook() {
        loginRespository?.signinUsingFacebook()
    }
    
    func startSigninUsingApple() {
        loginRespository?.signinUsingApple()
    }
    
    
    func startIsUserLogedin() -> Bool {
        return loginRespository?.isUserLogedin() ?? false
    }
    
    func satrtGetSigninMethod() -> String? {
        return loginRespository?.getSigninMethod()
    }
    
    func setOnSigninSuccessBundel(callback: @escaping (User) -> Void) {
        loginRespository?.onSuccessBudel = callback
    }
    
    
    
    
}
