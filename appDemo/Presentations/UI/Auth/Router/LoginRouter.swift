//
//  LoginRouter.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation
import UIKit

class LoginRouter : LoginRouterProtocol{
    weak var controller : ViewController?
    var profileFactory : FactoryProtocol?
    func goToHomePage(){
        if let view = profileFactory?.makeModule(){
            //controller?.show(view, sender: nil)
            view.modalPresentationStyle = .fullScreen
            view.modalTransitionStyle = .crossDissolve
            controller?.present(view, animated: true, completion: nil )
        }
               
        
    }
}
