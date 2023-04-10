//
//  ProfileFactory.swift
//  Clean-MVVM
//
//  Created by youssef osama on 12/01/1402 AP.
//

import Foundation

import UIKit.UIViewController
class ProfileFactory : FactoryProtocol{
    
    
    func makeModule() -> UIViewController{
        
        //profile-respository START
        var profileRepository : ProfileRepositoryDelegate = ProfileRepository()
        profileRepository.userLocalPresistence = UserLocalPersistence()
        var keyChain : UserKeychianPersistenceProtocol = UserKeychainPersistince()
        keyChain.keyChain =  Keychain()
        profileRepository.userKeychainPresistence = keyChain
        
        
        //profile-respository END
        
        //profile-usecase START
        let profileUseCase = ProfileUseCase()
        profileUseCase.profileRepository = profileRepository
        //profile-usecase END
        
        //profile-view-model START
        let profileViewModel =  ProfileViewModel()
        profileViewModel.profileUseCase = profileUseCase
        //profile-view-model END
        
        //profile-view-controller START
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        var router : ProfileRouterProtocol = ProfileRouter()
        
        router.loginFactory = LoginFactory()
        router.controller =  view
        view.profileViewModel = profileViewModel
        view.router =  router
        profileRepository.viewController =  view
        //profile-view-controller START
        
        profileRepository.checkForAuthService()
        
        return view
    }
}

