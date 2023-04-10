//
//  UserPersistence.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation


class UserLocalPersistence : UserLocalPresistenceProtocol{
   
 
    private var tokenKeychain : Securable?
    func loadUserData() -> User? {
        print("Data Loaded form user defults ....")
        
        guard let data =  UserDefaults.standard.value(forKey: Constant.userIdentifier) as? Data else {
            return nil
            
        }
        guard let userData = try? JSONDecoder().decode(User.self, from: data) else  {
            
            
            
            return nil
        }
        
        return userData
    }
    
    func saveSigninMethod(method: String = "defult") {
        UserDefaults.standard.set(method, forKey: Constant.signinMethod)
    }
    
    func getSigninMethod() -> String? {
        return UserDefaults.standard.value(forKey: Constant.signinMethod) as? String
    }
    
    
    
    
    func saveLocalUserData(currentUser: User) -> Bool {
        if let data = try? JSONEncoder().encode(currentUser) {
                      
                      UserDefaults.standard.set(data, forKey: Constant.userIdentifier)
                      return true
        }
        return false
    }
    
    func deleteLocalUserData()  {
        UserDefaults.standard.removePersistentDomain(forName: Constant.tokenIdentifier)
    }
    
    
}
