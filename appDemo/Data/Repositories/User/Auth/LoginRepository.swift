//
//  LoginRepository.swift
//  Clean-MVVM
//
//  Created by youssef osama on 10/01/1402 AP.
//

import Foundation


class LoginRepository : LoginRepositoryDelegate{
  
  
 
    
    var userKeychain: UserKeychianPersistenceProtocol?
    
    var userLocalPrsistince: UserLocalPresistenceProtocol?
    

    
    var apiManager: ApiManagerProtocol?
    
    var facebookAuth : Authintecatable?
    
    var googleAuth : Authintecatable?
    
    var appleAuth : Authintecatable?
    
    var onSuccessBudel : (_ user : User) -> Void = {
        user in
        print(user)
    }
    func onSignInFailed(error : Error) {
        
        print(error)
    }
    
    func onSignInSuccess(user : User) {
        if userKeychain?.upsertIsUserLogedIn(isUserLogedIn: true) ?? false{
            onSuccessBudel(user)
        }                        
    }
    
    
    func getSigninMethod() -> String? {
        return userLocalPrsistince?.getSigninMethod()
    }
    

  
    
    
    func signinUsingGoolge(){
        googleAuth?.singIn() {
            user , error in
           if let error =  error{
                print("error using google auth")
                self.onSignInFailed(error: error)
               return
            }
            if let user =  user{
                self.userLocalPrsistince?.saveSigninMethod(method: "google")
                print("signed in using google")
                self.onSignInSuccess(user: user)
            }
            
        }
    }
    	
    func signinUsingFacebook(){
        facebookAuth?.singIn(){
            user , error in
           if let error =  error{
                print("error using facebook auth")
                self.onSignInFailed(error: error)
               return
            }
            if let user =  user{
                self.userLocalPrsistince?.saveSigninMethod(method: "facebook")
                print("signed in using facebook")
                self.onSignInSuccess(user: user)
            }
            
        }
    }
    
    func signinUsingApple(){
        appleAuth?.singIn(){
            user , error in
           if let error =  error{
                print("error using apple auth")
                self.onSignInFailed(error: error)
               return
            }
            if let user =  user{
                self.userLocalPrsistince?.saveSigninMethod(method: "apple")
                print("signed in using apple")
                self.onSignInSuccess(user: user)
            }
            
        }
    }
    
    func loginUser(userEmail : String , password:String) async  -> Result<User , CustomError>{
        
        do{
            let  decodedData = try await apiManager?.request(url: URL(string: "\(Constant.url)\("login")") ,
                                                             type: Root<User>.self,
                                                             method: .POST,
                                                             
                                                             body: ["email":userEmail,"password":password],
                                                             params: nil, headers: nil)
            
            
            print("completed")
            if (399 ... 511) ~= decodedData?.code ?? 0 {
                
                return .failure(CustomError(decodedData?.message ?? "Somthing went worng !!"))
                
            }
            
            let isDataUpdated = userKeychain?.upsertIsUserLogedIn(isUserLogedIn: true)
           
            let isUserTokenSaved = userKeychain?.upsertUserToken(decodedData?.data?.accessToken ?? "")
            let isUserLocalDataSaved = userLocalPrsistince?.saveLocalUserData(currentUser: decodedData?.data ?? User())
            
            if isDataUpdated ?? false && isUserTokenSaved ?? false && isUserLocalDataSaved ?? false {
                userLocalPrsistince?.saveSigninMethod(method: "defult")
                print("all user data saved")
                return .success(decodedData?.data ?? User())
            }
             
         
         
           return .failure(CustomError("Somthing went worng !!"))
            
            
        }catch{
           
            print(error)
            return .failure(CustomError(error.localizedDescription))
        }
    }
    
    func isUserLogedin() -> Bool {
        
        return userKeychain?.getIsUserLogedin() == "true"
    }
    
 
    
    
    
}


