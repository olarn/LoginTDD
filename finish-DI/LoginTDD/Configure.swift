//
//  Configure.swift
//  LoginTDD
//
//  Created by Olarn U. on 26/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

class Configure {
    
    static var isProduction: Bool {
        let production = ProcessInfo.processInfo.environment["PRODUCTION"] ?? ""
        return production == "YES"
    }
}
