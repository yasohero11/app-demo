//
//  ProfileUserCaserDelegate.swift
//  Clean-MVVM
//
//  Created by youssef osama on 11/01/1402 AP.
//

import Foundation
protocol ProfileUseCaseDelegate {
    var profileRepository : ProfileRepositoryDelegate? {get set}
    
    
    
    func startGetCurrenSigninUser(callback : @escaping (_ user : User? , _ error : Error?) -> Void)
    
    func startGetSigninMethod() -> String
    
    func startSignOut() -> Bool
    
}
