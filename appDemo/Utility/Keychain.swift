//
//  TokenKeychain.swift
//  gameMasterApi
//
//  Created by youssef osama on 24/12/1401 AP.
//

import Foundation

import Security



protocol Securable{
    func insertData(_ data: Data, identifier: String) throws
    func getData(identifier: String) throws -> String
    func updateData(_ data : Data , identifier : String) throws
    func upsertData(_ token: Data, identifier: String) throws
    func deleteData(identifier : String) throws
}

enum KeychainError: LocalizedError {
    /// The requested item was not found in the Keychain.
    case itemNotFound
    /// Attempted to save an item that already exists.
    /// Update the item instead.
    case duplicateItem
    /// The operation resulted in an unexpected status.
    case unexpectedStatus(OSStatus)
}
class Keychain : NSObject , Securable{
  
    
    /// Errors that can be thrown when the Keychain is queried.


    /// A service that can be used to group the tokens
    /// as the kSecAttrAccount should be unique.
    let service = "asas.gameMasterApi"
    
 
    func insertData(_ data: Data, identifier: String) throws {
        let attributes = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: self.service,
            kSecAttrAccount: identifier,
            kSecValueData: data
        ] as CFDictionary

        let status = SecItemAdd(attributes, nil)
        guard status == errSecSuccess else {
            if status == errSecDuplicateItem {
                throw KeychainError.duplicateItem
            }
            throw KeychainError.unexpectedStatus(status)
        }
        
    }
    

    
    func getData(identifier: String) throws -> String {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: identifier,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecReturnData: true
        ] as CFDictionary

        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)

        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                // Technically could make the return optional and return nil here
                // depending on how you like this to be taken care of
                throw KeychainError.itemNotFound
            }
            throw KeychainError.unexpectedStatus(status)
        }
        print("data")
        print(String(data: result  as! Data, encoding: .utf8)!)
        return String(data: result  as! Data, encoding: .utf8)!
    }
    
    func deleteData(identifier: String) throws {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: identifier
        ] as CFDictionary
        
        let status = SecItemDelete(query)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.unexpectedStatus(status)
            
        }
    }
    
    

  
    
    
    func updateData(_ data : Data , identifier : String) throws{
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: identifier
        ] as CFDictionary

        let attributes = [
            kSecValueData: data
        ] as CFDictionary

        let status = SecItemUpdate(query, attributes)
        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                throw KeychainError.itemNotFound
            }
            throw KeychainError.unexpectedStatus(status)
        }
        
    }
    
    func upsertData(_ data: Data, identifier: String) throws {
        do {
            _ = try getData(identifier: identifier)
            try updateData(data, identifier: identifier)
        } catch KeychainError.itemNotFound {
            try insertData(data, identifier: identifier)
        }
    }

}
