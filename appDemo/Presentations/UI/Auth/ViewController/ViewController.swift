//
//  ViewController.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import UIKit
import AuthenticationServices
class ViewController: UIViewController {
    
   
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    var loginViewModel : LoginViewModelDelegate?
    var router : LoginRouterProtocol?
    private var alert : Alert =  Alert()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if loginViewModel?.executeIsUserLoagedIn() ?? false{
            
            if let signinMethod =  loginViewModel?.executeGetSigninMethod(){
                print("Signin Method ..... . ..  . .")
                print(signinMethod)
                
            }
            router?.goToHomePage()
        }
        
       
        loginViewModel?.setOnSigninSuccessBundel(){
            user in
            
            print("login Succesfully ..")
            
            self.router?.goToHomePage()
        }
        
        loginViewModel?.user.bind({
            user in
            print("form view Controller")
            if user != nil{
                DispatchQueue.main.async(execute:{
                    self.alert.showDefultAlert(self, title: "Success Message", message:  "Logedin Successfully"){
                        action in
                        
                        self.router?.goToHomePage()
                        
                    }
                })
            }
        })
        
        loginViewModel?.errorObservable.bind({
            error in
            
            if let message =  error?.message {
                print("error observer")
                DispatchQueue.main.async(execute:{
                    self.alert.showDefultAlert(self, title: "Auth Error", message: message )
                })
            }
            
            
        })
    }
    
    @IBAction func loginUsingApple(_ sender: Any) {
        loginViewModel?.executeSignInUsingApple()
    }
    
    @IBAction func loginUsingfacebook(_ sender: Any) {
        loginViewModel?.executeSignInUsingFacebook()
    }
    
    @IBAction func loginUsingGoogle(_ sender: Any) {
        loginViewModel?.executeSignInUsingGoogle()
        
    }
    
    @IBAction func login(_ sender: Any) {
        let emailValue = emailField.text!
        let passwordValue =  passwordField.text!
        if(emailValue.isEmpty || passwordValue.isEmpty){
            self.alert.showDefultAlert(self,title: "Auth", message:"Please Enter All Fields"){ action in
                self.dismiss(animated: true, completion: nil)
            }
            
            return
        }
  /*
        if self.userVi.isUserLogedin() {
            print("user is already logedin")
            return
        }
   */
  Task{
      
         await self.loginViewModel?.executeLogin(username:emailValue, password:passwordValue)
      
  }
    }
    

}


extension ViewController : ASAuthorizationControllerDelegate{
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        print("ennnnnnnn")
        print(authorization.credential)
        switch authorization.credential
        {
           
        case let credntial as ASAuthorizationAppleIDCredential:
            print("data .......")
            print(credntial)
            break
        default:
            print("ennnn222")
            break
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Failed")
        print(error)
       
    }
}

extension ViewController : ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
    
}




    
    /*

<key>CFBundleURLTypes</key>
<array>
  <dict>
  <key>CFBundleURLSchemes</key>
  <array>
    <string>772840337417338</string>
  </array>
  </dict>
</array>
<key>FacebookAppID</key>
<string>772840337417338</string>
<key>FacebookClientToken</key>
<string>088071e2449e7218f13178869bddbefb</string>
<key>FacebookDisplayName</key>
<string>appDemo</string>
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>fbapi</string>
  <string>fb-messenger-share-api</string>
</array>
    
}
*/

