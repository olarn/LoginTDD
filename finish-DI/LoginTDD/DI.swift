//
//  DI.swift
//  LoginTDD
//
//  Created by Olarn U. on 26/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation
import Swinject

class DI {
    
    static let container = Container()
    
    static func register() {
        if Configure.isProduction {
            container.register(UserServicesProtocol.self, factory: { _ in UserServices() })
            container.register(RestClientProtocol.self, factory: { _ in RestClient() })
        } else {
            container.register(UserServicesProtocol.self, factory: { _ in StubUserServiceSuccess() })
            container.register(RestClientProtocol.self, factory: { _ in StubRestClientForAuthenUserSuccess() })
        }
    }
}
