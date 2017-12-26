//
//  LoginTDDTests.swift
//  LoginTDDTests
//
//  Created by Olarn U. on 20/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import XCTest
@testable import LoginTDD

class LoginPresenterTests: XCTestCase {
    
    var presenter: LoginPresenter!
    
    override func setUp() {
        super.setUp()
        presenter = LoginPresenter()
    }
    
    func testLoginButtonShouldBeFalseWhenInputEmptyUserNameAndPassword() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let emptyUserName = ""
        let emptyPassword = ""

        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }

        presenter.set(userName: emptyUserName, password: emptyPassword)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testLoginButtonShouldBeFalseWhenEnterUserNameAndBlankPassword() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let username = "user@mail.com"
        let emptyPassword = ""
        
        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }
        
        presenter.set(userName: username, password: emptyPassword)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testLoginButtonShouldBeFalseWhenEnterBlankUserNameWithPassword() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let emptyUserName = ""
        let password = "12345678"
        
        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }
        
        presenter.set(userName: emptyUserName, password: password)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testLoginButtonShouldBeFalseWhenEnterSpaceUserNameAndSpacePassword() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let emptyUserName = "        "
        let emptyPassword = "        "
        
        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }
        
        presenter.set(userName: emptyUserName, password: emptyPassword)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testLoginButtonShouldBeFalseWhenNotEnterUserNameWithEmail() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let notEmailUsername = "user.someone"
        let password = "12345678"
        
        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }
        
        presenter.set(userName: notEmailUsername, password: password)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testLoginButtonShouldBeFalseWhenEnterPasswordTooShort() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let userName = "user@mail.com"
        let tooShortPassword = "123456"
        
        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }
        
        presenter.set(userName: userName, password: tooShortPassword)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testLoginButtonShouldBeFalseWhenEnterPasswordTooLong() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let userName = "user@mail.com"
        let tooLongPassword = "123456789abcdefg"
        
        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }
        
        presenter.set(userName: userName, password: tooLongPassword)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testLoginButtonShouldBeTrueWhenEnterValidUserNameAndPassword() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = true
        let userName = "user@mail.com"
        let password = "12345678"
    
        presenter.buttonLoginState = { state in
            XCTAssertTrue(state == expectedButtonState, #function)
            expected.fulfill()
        }
        
        presenter.set(userName: userName, password: password)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testAuthenWithStubUserServiceShouldReturnSuccess() {
        let expected = expectation(description: #function)
        let userName = "user@mail.com"
        let password = "12345678"
        let expectedResult = true
        let expectedMessage = "granted"
        
        presenter.userServices = StubUserServiceSuccess()
        
        presenter.userAuthenCallback = { result, message in
            XCTAssertTrue(expectedResult == result, "expected :- \(expectedResult), actual :- \(result)")
            XCTAssertTrue(expectedMessage == message, "expected :- \(expectedMessage), actual :- \(message)")
            expected.fulfill()
        }
        
        presenter.authen(with: userName, password: password)
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
}
