//
//  GoogleAuth4.swift
//  appDemo
//
//  Created by youssef osama on 16/01/1402 AP.
//

import Foundation

import GoogleSignIn

import UIKit
class GoogleAuth  : Authintecatable{

   
    
    private var user : Observable<User?>  = Observable(nil)
    private let viewController : UIViewController
    
    
    init(viewController : UIViewController){
        self.viewController =  viewController
    }
    
    func observe( closure: @escaping (_ user : User? ) -> Void){
        user.bind(closure)
    }
    
    func signIn(){
        Task{
            await self.signIn()
        }
        
        print("a a a  a a a a  a a a a a a a  aa a  a a a a a  ")
        
       
    }
    
    
  
    
    func signIn() async{
        do{
           let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController)
            print("Token .... ")
            user.value =  getUserModel(googleUser: result.user)
            print(user.value)
            
         
            
        }catch{
            print("error in signin")
            print(error)
        }
        
        
    }
    
 
    func singIn(callback : @escaping (_ user : User? ,_ error : Error?) -> Void){
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController){
            result , error in
            if let result = result {
                self.user.value = self.getUserModel(googleUser: result.user)
                callback(self.user.value , nil)
                
              
                return
            }
            
            if let error = error{
                callback(nil, error)
            }
        }
    }
    

    func getCurrentUserAccessToken() async -> String?{
        return await getCurrentUser()?.accessToken
    }
    
    
    
    
    func getCurrentUser(callback : @escaping (_ user : User? ,_ error : Error?) -> Void){
        
        
        GIDSignIn.sharedInstance.restorePreviousSignIn(){
            user , error in
            
           
            if let error = error{
           
                callback(nil , error)
                return
            }
            if let user  = user{                              
                self.user.value = self.getUserModel(googleUser: user)
                callback(self.user.value ,  nil)
            }
        }
        
        
    }
    
    
    func getCurrentUser() async -> User?{
        do{
           
            let googleUser  = try await GIDSignIn.sharedInstance.restorePreviousSignIn()
            user.value = getUserModel(googleUser: googleUser)
            return user.value
           

        }catch{
            print("error in restoring")
            print(error)
        }
      
        return nil
    }
    
    private func getUserModel(googleUser : GIDGoogleUser) -> User{
        
        var userData =   UserData()
        userData.id = Int(googleUser.userID ?? "") 
        userData.name = googleUser.profile?.givenName
        userData.role = "user"
        userData.email = googleUser.profile?.email
        userData.image = googleUser.profile?.imageURL(withDimension: 320)
        
        
        return User(accessToken:googleUser.accessToken.tokenString,userData:userData)
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        user.value = nil
    }
    
}
