//
//  LoginUseCaseDelegate.swift
//  Clean-MVVM
//
//  Created by youssef osama on 11/01/1402 AP.
//

import Foundation

protocol LoginUseCaseDelegate{
    
    var loginRespository : LoginRepositoryDelegate? {get set}
    

    
    func startLogin(userEmail : String , password : String) async -> Result<User , CustomError>
    
    func startSigninUsingGoolge()
    
    func startSigninUsingFacebook()
    
    func startSigninUsingApple()
    
    func setOnSigninSuccessBundel( callback: @escaping (_ user : User ) -> Void)
    
    func startIsUserLogedin() -> Bool
    func satrtGetSigninMethod() -> String? 
    

  
    
    
}
