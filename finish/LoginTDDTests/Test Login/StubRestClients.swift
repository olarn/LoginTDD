//
//  MockUserData.swift
//  LoginTDDTests
//
//  Created by Olarn U. on 25/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation
@testable import LoginTDD

class StubRestClientForAuthenUserSuccess: RestClientProtocol {
    func request(method: HTTPMethod, body: Data?, response: (Data, ResponseError?) -> Void) {
        let responseDictionary = ["status": "granted"]
        let responseData = try! JSONSerialization.data(withJSONObject: responseDictionary, options: [])
        response(responseData, nil)
    }
}

class StubRestClientForAuthenInvalidUsernameAndPassword: RestClientProtocol {
    func request(method: HTTPMethod, body: Data?, response: (Data, ResponseError?) -> Void) {
        let responseDictionary = ["status": "Invalid Username and/or Password"]
        let responseData = try! JSONSerialization.data(withJSONObject: responseDictionary, options: [])
        response(responseData, ResponseError.NotFound)
    }
}

class StubRestClientWithInvalidJSONFormatForAuthenUser: RestClientProtocol {
    func request(method: HTTPMethod, body: Data?, response: (Data, ResponseError?) -> Void) {
        let invalidData = "This is not a valid JSON String".data(using: .utf8)!
        response(invalidData, nil)
    }
}

class StubRestClientWithInvalidJSONAttributeForAuthenUser: RestClientProtocol {
    func request(method: HTTPMethod, body: Data?, response: (Data, ResponseError?) -> Void) {
        let responseDictionary = ["attribute": "something"]
        let responseData = try! JSONSerialization.data(withJSONObject: responseDictionary, options: [])
        response(responseData, ResponseError.NotFound)
    }
}
