//
//  ProfileUserCase.swift
//  Clean-MVVM
//
//  Created by youssef osama on 11/01/1402 AP.
//

import Foundation


class ProfileUseCase : ProfileUseCaseDelegate{
    
    
    var profileRepository: ProfileRepositoryDelegate?
    func startGetCurrenSigninUser(callback: @escaping (User?, Error?) -> Void) {
        profileRepository?.getCurrenSigninUser(callback: callback)
    }
    
    func startGetSigninMethod() -> String {
        return profileRepository?.getSigninMethod() ?? "defult"
    }
    
    func startSignOut() -> Bool {
        return profileRepository?.signOut() ?? false
    }
    
 
    

    
    
}
