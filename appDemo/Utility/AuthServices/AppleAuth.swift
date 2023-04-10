//
//  AppleAuth.swift
//  appDemo
//
//  Created by youssef osama on 19/01/1402 AP.
//

import Foundation

import AuthenticationServices
class AppleAuth  : Authintecatable{

    

    
  
    
   var viewController : ASAuthorizationControllerDelegate & ASAuthorizationControllerPresentationContextProviding
    
    init(viewController : ASAuthorizationControllerDelegate & ASAuthorizationControllerPresentationContextProviding){
        self.viewController =  viewController
     
        
    }
    
    let failerHandeler :( _ error : Error) -> () = {
        error in
        print(error)
    }
    
    
    private var compleationHandeler : ( _ authorization: ASAuthorization ) -> () = { authorization in
        print("ennnnnnnn")
        print(authorization.credential)
        
        
        switch authorization.credential
        {
           
        case let credntial as ASAuthorizationAppleIDCredential:
            print("data .......")
            print(credntial)
            
            break
        default:
            print("ennnn222")
            break
        }
    }
    
   
   
    
    func onSignInSuccessfuly(authorization: ASAuthorization){
        
        compleationHandeler(authorization)
      
    }
    
    
    func signIn() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
                    
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = viewController
            authorizationController.presentationContextProvider = viewController
            authorizationController.performRequests()
        
    }
    
    func singIn(callback: @escaping (User?, Error?) -> Void) {
        signIn()
    }
    
    func signOut() {
      
    }
    
    func observe(callback: @escaping (User?, Error?) -> Void) {
       
    }
    
    func getCurrentUser(callback: @escaping (User?, Error?) -> Void) {
        
    }
    
    func getCurrentUserAccessToken() -> String? {
        return ""
    }
    
    func signInFailed(callback : @escaping (_ error:  Error)->Void){
        
    }
    
    
}




