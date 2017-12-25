//
//  UserServices.swift
//  LoginTDD
//
//  Created by Olarn U. on 25/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

let INVALID_JSON_FORMAT = "Invalid JSON format"

class UserServices: UserServicesProtocol {
    
    private var client: RestClientProtocol?
    
    var restClient: RestClientProtocol? {
        get {
            return self.client
        }
        set {
            self.client = newValue
        }
    }
    
    func authen(with user: User, result: (Bool, String) -> Void) {
        restClient?.request(method: .post, body: user.toData()) { responseData, error in
            do {
                let responseDict = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]
                let status = (responseDict?["status"] as? String) ?? ""
                if status == "" {
                    result(false, INVALID_JSON_FORMAT)
                    return
                }
                if error != nil {
                    result(false, status)
                    return
                }
                result(true, status)
            } catch {
                result(false, INVALID_JSON_FORMAT)
            }
        }
    }
}
