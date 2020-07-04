//
//  File.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/2/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper
import JWTDecode

class Utilities {
    func setTokenInKeyChain(token: String, key: String) -> Bool {
        let saveSuccessful: Bool = KeychainWrapper.standard.set(token, forKey: key);
        return saveSuccessful;
    }

    func getToken() -> String {
        if let token = KeychainWrapper.standard.string(forKey: "token") {
            return token;
         }
        else {
            return "nil"
        }
     }
     
     func getAdminToken() -> String {
        if let adminToken = KeychainWrapper.standard.string(forKey: "adminToken") {
            return adminToken;
         }
        else {
            return "nil"
        }
    }
     
     func getEmployeeToken() -> String {
        if let employeeToken = KeychainWrapper.standard.string(forKey: "employeeToken") {
            return employeeToken;
         }
        else {
            return "nil"
        }
     }
    
    func logout(key: String) {
        KeychainWrapper.standard.removeObject(forKey: key)
    }
    
    func decodeAdminToken() -> [String: Any]? {
        do {
            let decodedToken = try decode(jwt: getAdminToken())
            let admin = decodedToken.body["admin"] as? [String: Any];
            return admin;
        } catch {
            print("could not decode token")
        }
        return nil;
    }
    
    func getBusinessId() -> String? {
        if let decodedToken = decodeAdminToken() {
            if let businessId = decodedToken["businessId"] as? String {
                return businessId;
            }
        }
        return nil;
    }
    
    func decodeEmployeeToken() -> [String: Any]? {
        do {
            let decodedToken = try decode(jwt: getEmployeeToken())
            let employee = decodedToken.body["employee"] as? [String: Any];
            return employee;
        } catch {
            print("could not decode token")
        }
        return nil;
    }
    
    func getEmployeeId() -> String? {
           if let decodedToken = decodeEmployeeToken() {
               if let employeeId = decodedToken["id"] as? String {
                   return employeeId;
               }
           }
           return nil;
       }
    
    func getUserId() -> String? {
        if let decodedToken = decodeUserToken() {
            print(decodedToken)
            if let userId = decodedToken["id"] as? String {
                return userId;
            }
        }
        return nil;
    }
    
    func decodeUserToken() -> [String: Any]? {
        do {
            let decodedToken = try decode(jwt: getToken())
            return decodedToken.body["user"] as? [String: Any];
        } catch {
            print("could not decode token")
        }
        return nil;
    }

}
