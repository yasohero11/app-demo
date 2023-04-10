//
//  ApiMangerProtocol.swift
//  Clean-MVVM
//
//  Created by youssef osama on 11/01/1402 AP.
//

import Foundation


enum ApiError: Error {
    case clientError
    case serverError
    case unknownError
    case errorInUrl
    case errorDecoding
}

enum Result<Success, Failure> where Failure : CustomError {

    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Failure)
}

enum HttpResponseStatus {
    static let ok = 200...299
    static let clienteError = 400...499
    static let serverError = 500...599
}

enum Methods :String{
    case POST
    case GET
    case PUT
    case DELETE
}

protocol ApiManagerProtocol{


    func request<T: Decodable>(url: URL?, type: T.Type ,method : Methods,
                            body: [String : Any]? ,
                            params : [String : Any]?,
                            headers:[String : Any]?) async throws -> T
}
