//
//  ProfileViewModelDelegate.swift
//  appDemo
//
//  Created by youssef osama on 21/01/1402 AP.
//

import Foundation

protocol ProfileViewModelDelegate {
    var profileUseCase : ProfileUseCaseDelegate? {get set}
    
    
    
    func executeGetCurrenSigninUser(callback : @escaping (_ user : User? , _ error : Error?) -> Void)
    
    func executeGetSigninMethod() -> String
    
    func executeSignOut() -> Bool
}
