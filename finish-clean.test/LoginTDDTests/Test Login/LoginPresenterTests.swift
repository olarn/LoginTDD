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
    
    let testData = [

        (case: "test login button should be false when input empty userName & password",
         userName: "", password: "", loginButtonState: false),
        
        (case: "test Login Button Should Be False When Enter UserName And Blank Password",
         userName: "user@mail.com", password: "", loginButtonState: false),
        
        (case: "test Login Button Should Be False When Enter Blank UserName With Password",
         userName: "", password: "12345678", loginButtonState: false),

        (case: "test Login Button Should Be False When Enter UserName And Password with Space",
         userName: "        ", password: "        ", loginButtonState: false),
        
        (case: "test Login Button Should Be False When Not Enter UserName WithEmail",
         userName: "user.someone", password: "12345678", loginButtonState: false),
        
        (case: "test Login Button Should Be False When Enter Password Too Short",
         userName: "user@mail.com", password: "123456", loginButtonState: false),
        
        (case: "test Login Button Should Be False When Enter Password Too Long",
         userName: "user@mail.com", password: "123456789abcdefg", loginButtonState: false),
        
        (case: "test Login Button Should Be True When Enter Valid UserName And Password",
         userName: "user@mail.com", password: "12345678", loginButtonState: true),
        
        ]
    
    override func setUp() {
        super.setUp()
        presenter = LoginPresenter()
    }
    
    func testLoginButtonStateWithUsernameAndPasswordSpecs() {
        testData.forEach { testCase, username, password, expectedButtonLoginState in
            let expected = expectation(description: testCase)
            
            presenter.buttonLoginState = { state in
                XCTAssertTrue(state == expectedButtonLoginState, testCase)
                expected.fulfill()
            }
            
            presenter.set(userName: username, password: password)

            waitForExpectations(timeout: 1) { error in
                if let e = error {
                    XCTFail(e.localizedDescription)
                }
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
