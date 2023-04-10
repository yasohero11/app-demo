//
//  UserPersistenceProtocol.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation


protocol UserLocalPresistenceProtocol{
    func loadUserData() -> User?
    
    func saveLocalUserData(currentUser : User) -> Bool
    func saveSigninMethod(method : String)
    func getSigninMethod() -> String?
    func deleteLocalUserData()
}
