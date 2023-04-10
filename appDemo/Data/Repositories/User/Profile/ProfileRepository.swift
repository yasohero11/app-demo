//
//  ProfileRepository.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation

import UIKit
class ProfileRepository : ProfileRepositoryDelegate{
    
    
   
    
    var userLocalPresistence: UserLocalPresistenceProtocol?
    
    var userKeychainPresistence: UserKeychianPersistenceProtocol?
    var authService : Authintecatable?
    var viewController : UIViewController?

    
    func checkForAuthService(){
        if let viewController =  viewController{
            switch userLocalPresistence?.getSigninMethod(){
            case "facebook" :
                authService = FacebookAuth(viewController: viewController)
                break
            case "google":
                authService = GoogleAuth(viewController: viewController)
                break
            case "apple":
                break
            default:
                break
            }
        }
    }
    
    func isUserLogedin() -> Bool {
       
        return userKeychainPresistence?.getIsUserLogedin() == "true"
    }
    
    func getSigninMethod() -> String {
        return userLocalPresistence?.getSigninMethod() ?? "defult"
    }
    
    func getCurrenSigninUser(callback : @escaping (_ user : User? , _ error : Error?) -> Void) {
        
        if authService !=  nil {
           
            authService?.getCurrentUser(callback: callback)
            return
        }
        
        let user =  userLocalPresistence?.loadUserData()
        callback(user , nil)
        
        
    }
    
    func signOut() -> Bool{
        
        if authService !=  nil {
            authService?.signOut()
            let isUpdated =  userKeychainPresistence?.updateIsUserLogedIn(isUserLogedIn: false)
            return isUpdated ?? false
        }
        let isDeleted = userKeychainPresistence?.deleteUserToken()
        let isUpdated =  userKeychainPresistence?.updateIsUserLogedIn(isUserLogedIn: false)
        if isDeleted ?? false &&  isUpdated ?? false{
            userLocalPresistence?.deleteLocalUserData()
            return true
        }
        return false
    }
    
    
}
