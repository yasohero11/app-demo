//
//  LoginRouterProtocol.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation


protocol LoginRouterProtocol {
    func goToHomePage()
     var controller : ViewController? {get set}
    var profileFactory : FactoryProtocol? {get set}
}
