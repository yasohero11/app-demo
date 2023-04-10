//
//  LoginRepositpryDelegate.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation


protocol LoginRepositoryDelegate{
    var apiManager : ApiManagerProtocol?{get set}
    
    var userKeychain : UserKeychianPersistenceProtocol? {get set}
    var userLocalPrsistince : UserLocalPresistenceProtocol? {get set}
    
    var facebookAuth : Authintecatable? {get set}
    
    var googleAuth : Authintecatable? {get set}
    
    var appleAuth : Authintecatable? {get set}
    var onSuccessBudel : (_ user : User) -> Void {get set}
    
    func loginUser(userEmail : String , password:String) async  -> Result<User , CustomError>
    

    func isUserLogedin() -> Bool
    func getSigninMethod() -> String?
   

    func onSignInFailed(error : Error)
    
    func onSignInSuccess(user : User)
    
    func signinUsingGoolge()
    
    func signinUsingFacebook()
    
    func signinUsingApple()
  
    
}
