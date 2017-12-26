//
//  LoginPresenter.swift
//  LoginTDD
//
//  Created by Olarn U. on 21/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

typealias ButtonLoginState = (Bool) -> Void
typealias UserAuthenCallback = (Bool, String) -> Void

class LoginPresenter {

    var userServices: UserServicesProtocol?
    
    //MARK:- Input
    
    func set(userName: String, password: String) {
        if let setButtonStateBy = buttonLoginState {
            let validateResult = userName.isNotEmpty() && password.isNotEmpty() &&
                userName.isValidEmail() &&
                password.notTooShort() &&
                password.notTooLong()
            setButtonStateBy(validateResult)
        }
    }
    
    func authen(with userName: String, password: String) {
        if let service = self.userServices {
            let user = User(userName: userName, password: password)
            service.authen(with: user, result: { result, message in
                if let callback = self.userAuthenCallback {
                    callback(result, message)
                }
            })
        }
    }
    
    //MARK:- Output
    
    var buttonLoginState: ButtonLoginState?
    var userAuthenCallback: UserAuthenCallback?
}

// MARK:- username and password validation logic

extension String {
    
    fileprivate func isNotEmpty() -> Bool {
        return
            self.trimmingCharacters(in: CharacterSet.whitespaces) != "" ||
            !self.isEmpty
    }
    
    fileprivate func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    fileprivate func notTooShort() -> Bool {
        return self.count >= 8
    }
    
    fileprivate func notTooLong() -> Bool {
        return self.count <= 15
    }
}
