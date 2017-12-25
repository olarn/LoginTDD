//
//  LoginServicesTests.swift
//  LoginTDDTests
//
//  Created by Olarn U. on 25/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import XCTest
@testable import LoginTDD

class LoginServicesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
    
        super.tearDown()
    }
    
    func testTransformUserObjectShouldGetJSONData() {
        
        // Arrange
        let username = "user@mail.com"
        let password = "12345678"
        let expectedUserJSONString = "{\"userName\":\"user@mail.com\",\"password\":\"12345678\"}"
        
        // Act
        let user = User(userName: username, password: password)
        
        // Assert
        let userData = user.toData()
        let actualUserString = String(data: userData!, encoding: .utf8) ?? ""
        
        XCTAssertTrue(
            expectedUserJSONString == actualUserString,
            "\rexpected :- \r\(expectedUserJSONString)\ractual :- \(actualUserString)")
    }
    
    func testUserAuthenShouldReturnSuccess() {
        
        // Arrange
        let expected = expectation(description: #function)
        let expectIsValid = true
        let expectStatus = "granted"

        let username = "user@mail.com"
        let password = "12345678"
        let user = User(userName: username, password: password)

        // Act
        let userServices = UserServices(restClient: StubRestClientForAuthenUserSuccess())
        userServices.authen(with: user) { isValid, status in
            
            // Assert
            XCTAssertTrue(expectIsValid == isValid, #function)
            XCTAssertTrue(expectStatus == status, "extected :- \(expectStatus), actual :- \(status)")
            expected.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testAuthenInvalidUsernameAndPasswordShouldReturnFail() {
        // Arrange
        let expected = expectation(description: #function)
        let expectIsValid = false
        let expectStatus = "Invalid Username and/or Password"
        
        let username = "noone@mail.com"
        let password = "11111111"
        let user = User(userName: username, password: password)
        
        // Act
        let userServices = UserServices(restClient: StubRestClientForAuthenInvalidUsernameAndPassword())
        userServices.authen(with: user) { isValid, status in
            
            // Assert
            XCTAssertTrue(expectIsValid == isValid, "extected :- \(expectIsValid), actual :- \(isValid)")
            XCTAssertTrue(expectStatus == status, "extected :- \(expectStatus), actual :- \(status)")
            expected.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testWhenServerReturnInvalidJSONFormatShouldReturnInvidFormat() {
        // Arrange
        let expected = expectation(description: #function)
        let expectIsValid = false
        let expectStatus = INVALID_JSON_FORMAT
        
        let username = "user@mail.com"
        let password = "12345678"
        let user = User(userName: username, password: password)
        
        // Act
        let userServices = UserServices(restClient: StubRestClientWithInvalidJSONFormatForAuthenUser())
        userServices.authen(with: user) { isValid, status in
            
            // Assert
            XCTAssertTrue(expectIsValid == isValid, "extected :- \(expectIsValid), actual :- \(isValid)")
            XCTAssertTrue(expectStatus == status, "extected :- \(expectStatus), actual :- \(status)")
            expected.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
    
    func testWhenServerReturnWrongJSONAttributeShouldReturnInvidFormat() {
        // Arrange
        let expected = expectation(description: #function)
        let expectIsValid = false
        let expectStatus = INVALID_JSON_FORMAT
        
        let username = "user@mail.com"
        let password = "12345678"
        let user = User(userName: username, password: password)
        
        // Act
        let userServices = UserServices(restClient: StubRestClientWithInvalidJSONAttributeForAuthenUser())
        userServices.authen(with: user) { isValid, status in
            
            // Assert
            XCTAssertTrue(expectIsValid == isValid, "extected :- \(expectIsValid), actual :- \(isValid)")
            XCTAssertTrue(expectStatus == status, "extected :- \(expectStatus), actual :- \(status)")
            expected.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }
}
