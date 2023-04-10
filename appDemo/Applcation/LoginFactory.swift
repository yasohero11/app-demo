//
//  LoginFactory.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation

import UIKit

class LoginFactory : FactoryProtocol{

    
    
    func makeModule() -> UIViewController{
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let apiManager : ApiManagerProtocol = ApiManager()
        var loginRepository : LoginRepositoryDelegate = LoginRepository()
        loginRepository.googleAuth =  GoogleAuth(viewController: view)
        loginRepository.facebookAuth =  FacebookAuth(viewController: view)
        loginRepository.appleAuth =  AppleAuth(viewController: view)
        var userKeyChain : UserKeychianPersistenceProtocol =  UserKeychainPersistince()
        userKeyChain.keyChain = Keychain()
        loginRepository.apiManager = apiManager
        loginRepository.userLocalPrsistince = UserLocalPersistence()
        loginRepository.userKeychain = userKeyChain
        var loginUseCase : LoginUseCaseDelegate = LoginUseCase()
        loginUseCase.loginRespository = loginRepository

        var loginViewModel: LoginViewModelDelegate =  LoginViewModel()
        
        loginViewModel.loginUseCase = loginUseCase
        
        view.loginViewModel = loginViewModel
   
        var loginRouter : LoginRouterProtocol = LoginRouter()
        loginRouter.profileFactory =  ProfileFactory()
           
        loginRouter.controller = view
        view.router = loginRouter
        print("all created")
        return view 
    }
}
