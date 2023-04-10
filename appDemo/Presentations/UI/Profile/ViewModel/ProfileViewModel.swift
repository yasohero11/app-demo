//
//  ProfileViewModel.swift
//  appDemo
//
//  Created by youssef osama on 21/01/1402 AP.
//

import Foundation


class ProfileViewModel : ProfileViewModelDelegate{
    var profileUseCase: ProfileUseCaseDelegate?
    
    func executeGetCurrenSigninUser(callback: @escaping (User?, Error?) -> Void) {
        
        profileUseCase?.startGetCurrenSigninUser(callback: callback)
    }
    
    func executeGetSigninMethod() -> String {
        return profileUseCase?.startGetSigninMethod() ?? "defult"
    }
    
    func executeSignOut() -> Bool {
        return profileUseCase?.startSignOut() ?? false
    }
    
    
}
