//
//  Authintecatable.swift
//  appDemo
//
//  Created by youssef osama on 16/01/1402 AP.
//

import Foundation

protocol Authintecatable{
    
    
    func signIn()
    func singIn(callback : @escaping (_ user : User? ,_ error : Error?) -> Void)
    func signOut()
    
    //func observe(callback : @escaping (_ user : User? ,_ error : Error? ) -> Void)
    func getCurrentUser(callback : @escaping (_ user : User? ,_ error : Error?) -> Void)
    
    //func getCurrentUserAccessToken() -> String?
    
    
}
