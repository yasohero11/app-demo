//
//  Alert.swift
//  gameMasterApi
//
//  Created by youssef osama on 29/12/1401 AP.
//

import Foundation
import UIKit


class Alert {
    
    
    
    func showDefultAlert(_ contoller : UIViewController,title: String, message: String ,okAction: @escaping (UIAlertAction)-> Void = {_ in }) {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: okAction)
        
        myAlert.addAction(action)
        contoller.present(myAlert, animated: true, completion: nil)
        
    }
    
    
    /*
    init{
        let myAlert = UIAlertController(title: "Alert", message: "Logedin successful", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { action in
            self.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "goToHome", sender: self)
             }
        
        myAlert.addAction(okAction)
    }
     */
    
}
