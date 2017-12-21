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
    
    override func tearDown() {

        super.tearDown()
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
        let emptyUserName = "user@mail.com"
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
    
    func testLoginButtonShouldBeFalseWhenEnterBlankUserNameWithPassword() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let emptyUserName = ""
        let emptyPassword = "12345678"
        
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
        let emptyUserName = "user.someone"
        let emptyPassword = "12345678"
        
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
    
    func testLoginButtonShouldBeFalseWhenEnterPasswordTooShort() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let emptyUserName = "user@mail.com"
        let emptyPassword = "123456"
        
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
    
    func testLoginButtonShouldBeFalseWhenEnterPasswordTooLong() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = false
        let emptyUserName = "user@mail.com"
        let emptyPassword = "123456789abcdefg"
        
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
    
    func testLoginButtonShouldBeTrueWhenEnterValidUserNameAndPassword() {
        let expected = expectation(description: #function)
        
        let expectedButtonState = true
        let emptyUserName = "user@mail.com"
        let emptyPassword = "12345678"
    
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
    
}
