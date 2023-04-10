//
//  CustomError.swift
//  MVVMExmp
//
//  Created by youssef osama on 11/01/1402 AP.
//

import Foundation


class CustomError : Error{
    let message : String
    init(_ message : String){
        self.message = message
    }
}
