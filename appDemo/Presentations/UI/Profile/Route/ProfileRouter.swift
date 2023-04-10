//
//  LoginRouter.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation
import UIKit

class ProfileRouter : ProfileRouterProtocol{
    weak var controller : ProfileViewController?
    
    
    var loginFactory : FactoryProtocol?
    
    
    func goToLoginPage(){        
        if let view = loginFactory?.makeModule(){
            view.modalPresentationStyle = .fullScreen
            view.modalTransitionStyle = .crossDissolve
            controller?.present(view, animated: true, completion: nil )
        }
    }
}
