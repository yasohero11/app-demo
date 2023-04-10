//
//  UserPersistenceKeyChain.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation


class UserKeychainPersistince: UserKeychianPersistenceProtocol{
 
    var keyChain: Securable?
    
    func saveUserToken(_ token : String) -> Bool {
        do
        {
            try keyChain?.insertData(token.data(using: .utf8) ?? Data(), identifier: Constant.tokenIdentifier)
            return true
        }catch{
            print("error in save user token")
            print(error)
            return false
        }
       
    }
    
    func deleteUserToken() -> Bool {
        do
        {
            try keyChain?.deleteData(identifier: Constant.tokenIdentifier)
            return true
        }catch{
            print("error in save user token")
            print(error)
            return false
        }
    }
    
    func getUserToken() -> String? {
        do
        {
            
            return try keyChain?.getData(identifier: Constant.tokenIdentifier)
        }catch{
            print("error in save user token")
            print(error)
            return nil
        }

    }
    
    func upsertUserToken(_ token : String) -> Bool {
        do
        {
            
            try keyChain?.upsertData( token.data(using: .utf8) ?? Data(), identifier: Constant.tokenIdentifier)
            return true
        }catch{
            print("error in save user token")
            print(error)
            return false
        }
    }
    
    func upsertIsUserLogedIn(isUserLogedIn : Bool) -> Bool{
        do{
            try keyChain?.upsertData(try JSONEncoder().encode(isUserLogedIn), identifier: Constant.isUserLogedinIdentifier)
                return true
        }catch{
            print("Error In is user logedin upsert function")
            return false
        }
     
    }
    
    func updateIsUserLogedIn(isUserLogedIn : Bool) -> Bool{
        do{
            
            try keyChain?.updateData(try JSONEncoder().encode(isUserLogedIn), identifier: Constant.isUserLogedinIdentifier)
            
            return true
            
        }catch{
            print("Error In is user logedin upsert function")
            return false
        }
    }
    
    
  
    
    func getIsUserLogedin() -> String {
        do{
            
            return try keyChain?.getData(identifier: Constant.isUserLogedinIdentifier) ?? "false"
        }catch{
            print("Error In is user is logedin function")
            print(error)
            return "false"
        }
    }
    
    
}
