//
//  UserServicesProtocol.swift
//  LoginTDD
//
//  Created by Olarn U. on 25/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

protocol UserServicesProtocol {
    var restClient: RestClientProtocol? { get set }
    func authen(with user: User, result: (Bool, String) -> Void)
}
