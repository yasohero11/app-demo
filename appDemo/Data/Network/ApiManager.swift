//
//  ApiManger.swift
//  MVVMExmp
//
//  Created by youssef osama on 02/01/1402 AP.
//

import Foundation





struct ApiManager : ApiManagerProtocol{
    
    

    
    private let session: URLSession
    
    init() {
        self.session = URLSession.shared
    }
    
    func request<T: Decodable>(url: URL?, type: T.Type ,method : Methods,
                            body: [String : Any]? = nil ,
                            params : [String : Any]? = nil,
                            headers:[String : Any]? = nil) async throws -> T {
            guard let url = url else { throw ApiError.errorInUrl  }
        
            var request = URLRequest(url:url)
         
         
             if let headers = headers {
                 for (key,value) in headers{
                     
                     print("Header ....")
                     
                     print("\(key)  \(value    )")
                     request.setValue(value as? String, forHTTPHeaderField: key)
                 }
             }

         
            if let body = body {
         
                let JSON = try! JSONSerialization.data(withJSONObject: body)
            
                /*
                guard let jsonData = try? JSONEncoder().encode(body) else {
                            print("Error: Trying to convert model to JSON data")
                            return
                        }
                 */
            
                    request.httpMethod = method.rawValue
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.setValue("application/json", forHTTPHeaderField: "Accept")
            
           
            request.httpBody = JSON
        }
        
     
        return try await makeRequest(url: request)
    }
    
    private func makeRequest<T: Decodable>(url: URLRequest) async throws -> T {
        let request = try await session.data(for: url)
        return try validateResponse(request:request)
    }
    
    private func validateResponse<T: Decodable>(
        request: (data: Data, httpResponse: URLResponse)
    ) throws -> T {
        guard let httpResponse = request.httpResponse as? HTTPURLResponse
        else { throw ApiError.unknownError }
        
        switch httpResponse.statusCode {
        case HttpResponseStatus.ok:
            
            return try decodeModel(data: request.data)
        case HttpResponseStatus.clienteError:
            throw ApiError.clientError
        case HttpResponseStatus.serverError:
            throw ApiError.serverError
        default:
            throw ApiError.unknownError
        }
    }
    
    private func decodeModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        print(data)
        let model = try? decoder.decode(T.self, from: data)
        guard let model = model else { throw ApiError.errorDecoding }
        return model
    }
}

