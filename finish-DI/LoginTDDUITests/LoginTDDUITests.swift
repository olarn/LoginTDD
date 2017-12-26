//
//  LoginTDDUITests.swift
//  LoginTDDUITests
//
//  Created by Olarn U. on 26/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import XCTest

class LoginTDDUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testLoginUIWithValidAccountShouldBeSuccess() {
        
        let app = XCUIApplication()
        let emailAsUsernameTextField = app.textFields["Email as Username..."]
        emailAsUsernameTextField.tap()
        emailAsUsernameTextField.typeText("user@mail.com")
        
        let passwordSecureTextField = app.secureTextFields["Password..."]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("12345678")
        app.buttons["Login"].tap()

    }
    
    func testLoginWithInvalidAccountShouldShowErrorDislog() {
        
        let app = XCUIApplication()
        let emailAsUsernameTextField = app.textFields["Email as Username..."]
        emailAsUsernameTextField.tap()
        emailAsUsernameTextField.typeText("user@mail.com")
        
        let passwordSecureTextField = app.secureTextFields["Password..."]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("11111111")
        app.buttons["Login"].tap()
        
        app.alerts["Error"].buttons["OK"].tap()
    }
}
