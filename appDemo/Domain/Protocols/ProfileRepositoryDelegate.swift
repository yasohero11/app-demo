//
//  ProfileRepositoryDelegate.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation

import UIKit.UIViewController

protocol ProfileRepositoryDelegate {
    var userLocalPresistence: UserLocalPresistenceProtocol? {get set}
    
    var userKeychainPresistence: UserKeychianPersistenceProtocol? {get set}
    var authService : Authintecatable? {get set}
    var viewController : UIViewController? {get set}
    
    func isUserLogedin() -> Bool
    func checkForAuthService()
    func getCurrenSigninUser(callback : @escaping (_ user : User? , _ error : Error?) -> Void)
    
    func getSigninMethod() -> String
    
    func signOut() -> Bool
}
