//
//  UserTokenPersistenceProtocol.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation


protocol UserKeychianPersistenceProtocol{
    var keyChain :Securable? { get set}
    func saveUserToken(_ token : String) -> Bool
    func deleteUserToken() -> Bool
    func getUserToken() -> String?
    func upsertUserToken(_ token : String) -> Bool
    func upsertIsUserLogedIn(isUserLogedIn : Bool) -> Bool
    func updateIsUserLogedIn(isUserLogedIn : Bool) -> Bool
    
    func getIsUserLogedin() -> String
    
}
