//
//  LoginPresenter.swift
//  LoginTDD
//
//  Created by Olarn U. on 21/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

typealias ButtonLoginState = (Bool) -> Void

class LoginPresenter {

    //MARK:- Input
    
    func set(userName: String, password: String) {
        if let setButtonStateTo = buttonLoginState {
            if userName.isEmpty || password.isEmpty ||
                !userName.isValidEmail() ||
                password.tooShort() ||
                password.tooLong()
            {
                setButtonStateTo(false)
                return
            }
            setButtonStateTo(true)
        }
    }
    
    //MARK:- Output
    var buttonLoginState: ButtonLoginState?
}

// MARK:- username and password validation logic

extension String {
    
    fileprivate func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    fileprivate func tooShort() -> Bool {
        return self.count < 8
    }
    
    fileprivate func tooLong() -> Bool {
        return self.count > 15
    }
}
