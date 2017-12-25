//
//  User.swift
//  LoginTDD
//
//  Created by Olarn U. on 21/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

struct User {
    let userName: String
    let password: String
    
    func toData() -> Data? {
        let userDictionary = [
            "userName": userName,
            "password": password
        ]
        return try? JSONSerialization.data(withJSONObject: userDictionary, options: [])
    }
}
