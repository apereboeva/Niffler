//
//  LoginUITests.swift
//  Niffler
//
//  Created by Анна Перебоева on 04.03.2025.
//

import XCTest

final class LoginUITests: TestCase {
    
    func testLoginSuccess() throws {
         let correctLogin = "stage"
         let correctPassword = "12345"
        
        launchAppWithoutLogin()

        loginPage
            .input(login: correctLogin, password: correctPassword)
            .assertNoErrorShown()
        spendsPage
            .assertIsSpendsViewAppeared()
    }
    
    func testLoginFailure() throws {
         let correctLogin = "stage"
         let incorrectPassword = "1"
        
        launchAppWithoutLogin()
        
        loginPage
            .input(login: correctLogin, password: incorrectPassword)
            .assertIsLoginErrorShown()
    }
}
