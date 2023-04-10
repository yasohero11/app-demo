//
//  FacebookAuth.swift
//  appDemo
//
//  Created by youssef osama on 17/01/1402 AP.
//

import Foundation

import FacebookLogin

import UIKit

class FacebookAuth : Authintecatable{
   
    
    func observe(callback: @escaping (_ user : User? ,_ error : Error?) -> Void) {
        facebookObserve(notfificationName: .AccessTokenDidChange){
            notification in
            if notification.userInfo?[AccessTokenDidChangeUserIDKey] != nil {
                
                
                print("Notify ....................")
                
                print(notification.userInfo?[AccessTokenDidChangeUserIDKey])
                print("access tokeeeeennnnnnnn .........")
                
                if let accessToken = AccessToken.current{
                    self.getCurrentUser(callback: callback)
                }
               
            }
        }
    }
    

    
    private let loginManager : LoginManager
    private let viewController : UIViewController
    init(viewController : UIViewController) {
        self.loginManager = LoginManager()
        self.viewController = viewController
    }
    
    
    func signIn(){
        Task{
             await self.signIn()
        }
    }
    
    func signIn() async{
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { result, error in
            /*
            print("errorrrr")
            print(error)
            print("ressssss")
            print(result)
             */
        }
    }
    
    func singIn(callback : @escaping (_ user : User? ,_ error : Error?) -> Void){
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { result, error in
            guard error == nil else {
                callback(nil , error)
                return
            }
            self.getCurrentUser(callback: callback)
        }
    }
    
  
    
    func getCurrentUser(callback : @escaping (_ user : User? ,_ error : Error?) -> Void) {
        if AccessToken.current != nil {
            
            GraphRequest(graphPath: "me", parameters: ["fields" : "first_name, last_name, email"]).start { connection, result, error in
                guard error == nil else{
                    callback(nil, error)
                    return
                }
                if let result = result as? NSDictionary {
                    
                    print("User Requesttttttttt")
                    
                    callback(self.getUserModel(result: result), nil)
                    /*
                    let facebookProfileUrl = "http://graph.facebook.com/\(result["id"] ?? "")/picture?type=large"
                    print(facebookProfileUrl)
                    print("Fetched Result: \(result)")
                     */
                }
            }
        }
    }
    
    private func getUserModel(result : NSDictionary) -> User{
        
        if let token = getCurrentUserAccessToken() {
            var userData =   UserData()
            userData.id = result["id"] as? Int
            userData.name = result["first_name"] as? String
            userData.role = "user"
            userData.email = result["email"] as? String
            userData.image = nil
            
            
            return User(accessToken:token,userData:userData)
        }
       return User()
    }
    
    func signOut(){
        loginManager.logOut()
    }
    
    func getCurrentUserAccessToken() async -> String?{
        if let token = AccessToken.current,
             !token.isExpired {
            print("tokkkkkeenennnnn")
            print(token)
            return token.tokenString
        }
        return nil
    }
    
  func getCurrentUserAccessToken() -> String?{
        if let token = AccessToken.current,
             !token.isExpired {
            print("tokkkkkeenennnnn")
            print(token)
            return token.tokenString
        }
        return nil
    }
    
    


   
    
    func facebookObserve(notfificationName : NSNotification.Name, callBack : @escaping(_ notification : Notification)->Void){
       
        NotificationCenter.default.addObserver(
            forName: notfificationName,
            object: nil,
            queue: .main
        ) { notification in
            
            callBack(notification)

        }
    }
    
    func enableUpdatesOnAccessTokenChange(callBack : @escaping(_ notification : Notification)->Void){
        Profile.enableUpdatesOnAccessTokenChange(true)
        facebookObserve(notfificationName: .ProfileDidChange, callBack: callBack)
    }
    
}
