//
//  LoginRouterProtocol.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation


protocol ProfileRouterProtocol {
    func goToLoginPage()
    
     var controller : ProfileViewController? {get set}
    var loginFactory : FactoryProtocol? {get set}
}
