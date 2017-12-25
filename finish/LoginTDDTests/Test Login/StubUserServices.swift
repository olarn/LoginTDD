//
//  StubUserServices.swift
//  LoginTDDTests
//
//  Created by Olarn U. on 25/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation
@testable import LoginTDD

class StubUserServiceSuccess: UserServicesProtocol {
    
    var restClient: RestClientProtocol?
    
    func authen(with user: User, result: (Bool, String) -> Void) {
        if user.userName == "user@mail.com" && user.password == "12345678" {
            result(true, "granted")
        } else {
            result(false, "Invalid Username and/or Password")
        }
    }
}
