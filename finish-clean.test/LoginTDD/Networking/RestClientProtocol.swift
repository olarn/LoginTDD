//
//  RestClientProtocol.swift
//  LoginTDD
//
//  Created by Olarn U. on 25/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case get
    case post
}

enum ResponseError: Error {
    case NotFound
}

protocol RestClientProtocol {
    func request(method: HTTPMethod, body: Data?, response: (Data, ResponseError?) -> Void)
}
