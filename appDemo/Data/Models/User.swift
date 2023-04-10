//
//  User.swift
//  MVVMExmp
//
//  Created by youssef osama on 02/01/1402 AP.
//

import Foundation



struct UserData : Codable{
    
    var id : Int?
    var name, role, email  : String?
    var image : URL?
    
}

struct User : Codable{
    var accessToken : String? = nil
    var userData : UserData? = nil
    
    
  
}
