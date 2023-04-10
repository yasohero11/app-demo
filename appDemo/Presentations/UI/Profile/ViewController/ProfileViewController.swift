//
//  ProfileViewController.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import UIKit

class ProfileViewController: UIViewController {
    var profileViewModel : ProfileViewModel?
    var router : ProfileRouterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test ..  .. . . .. ")
        
        print(profileViewModel?.profileUseCase?.profileRepository?.authService == nil)
        profileViewModel?.executeGetCurrenSigninUser(){
            user , error in
            
            guard error == nil else {
                print(error)
                return
            }
            
            
            print("current logedin user using \(self.profileViewModel?.executeGetSigninMethod()) ......")
            print(user)
            
        }
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logout(_ sender: Any) {
        print("logout")
   /*
        profileViewModel?.executeGetCurrenSigninUser(){
            user , error in
            
            guard error != nil else {
                print(error)
                return
            }
            
            
            print("current logedin user using \(self.profileViewModel?.executeGetSigninMethod()) ......")
            print(user)
            
        }
        */
        if profileViewModel?.executeSignOut() ?? false {
            router?.goToLoginPage()
        }
         
        
    }
    
  

}
