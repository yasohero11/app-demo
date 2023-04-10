//
//  ViewController.swift
//  appDemo
//
//  Created by youssef osama on 15/01/1402 AP.
//

import UIKit
/*

import FacebookLogin
import GoogleSignIn
import AuthenticationServices
class ViewController2: UIViewController {
    
    
    @IBOutlet weak var loginButton: FBLoginButton!
    @IBOutlet weak var testView: UIView!
    var googleAuth : GoogleAuth? =  nil
    @IBOutlet weak var confField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    var appleAuth : AppleAuth?
    
    
    var facebookAuth : FacebookAuth?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookAuth = FacebookAuth(viewController: self)
        
        
        facebookAuth?.getCurrentUser(){
            user , error in
            
            guard error == nil else{
                print("error")
                print(error)
                return
            }
            
            print("current User")
            print(user)
        }
        
        facebookAuth?.observe(){
            user  , error in
            
            if let user  =  user{
                print("sdasd asd asd asd asd as as s")
                print(user)
            }
        }
        /*
        googleAuth =  GoogleAuth(viewController: self)
            
         
           
           
            Task{
                print("courrent User")
                print(await googleAuth?.getCurrentUser())
            }
        
        
        googleAuth?.observe(){
            user in
            print("observer")
            print(user)
        }
           */
        
        /*
        
        facebookAuth = FacebookAuth(viewController: self)
        appleAuth =  AppleAuth(viewController: self)
        facebookAuth?.loadCurrentUser()
        
        
        facebookAuth?.facebookObserve(notfificationName: .AccessTokenDidChange){
            notification in
            
            print("access token  did changed")
            
        }
        
        facebookAuth?.getCurrentUser()
    */
        
        /*
        NotificationCenter.default.addObserver(
            forName: .AccessTokenDidChange,
            object: nil,
            queue: .main
        ) { notification in
            if notification.userInfo?[AccessTokenDidChangeUserIDKey] != nil {
                print("Notify ....................")
                print(notification.userInfo?[AccessTokenDidChangeUserIDKey])
                print("access tokeeeeennnnnnnn .........")
                print(AccessToken.current)
                
                print("profillllllelelelelleel")
                print(Profile.current?.name)
            }
        }
        */
        /*
        Profile.loadCurrentProfile { profile, error in
            if let firstName = profile?.imageURL{
                print("loaded profileeeeee e ee e ee e ee e e e  e  e e ")
                print("Hello, \(firstName)")
            }
        }
        
     */
        /*
        Profile.enableUpdatesOnAccessTokenChange(true)
        NotificationCenter.default.addObserver(
            forName: .ProfileDidChange,
            object: nil,
            queue: .main
        ) { notification in
            if let currentProfile = Profile.current {
                print("access token changed .... .. . . . . . . .. . . . .. . . . . . .. .. . ..  .. . . . . .. ....")
                
                print(currentProfile.imageURL(forMode: Profile.PictureMode.normal, size: CGSize(width: 300, height: 300)))
                
            }
        }
        
        
*/
        
        
   
       
    
    }

    @IBAction func action(_ sender: Any) {
        
       
        
           facebookAuth?.signIn()
        
        /*
        let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
                
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        */
        //facebookAuth?.signIn()
        
        /*
        Task{
            await googleAuth?.signIn(controller:self)
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            print("eeeeee")
            print(error)
            
            print("ressss")
            print(signInResult)
            // If sign in succeeded, display the app's main content View.
          }
         
         */
        
    }
    
 
    @IBAction func signOut(_ sender: Any) {
    
        facebookAuth?.signOut()
        
        //googleAuth?.signOut()
    }
    
}

extension ViewController2 : ASAuthorizationControllerDelegate{
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

extension ViewController2 : ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
    
}
*/
