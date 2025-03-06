//
//  LoginUITests.swift
//  Niffler
//
//  Created by Анна Перебоева on 04.03.2025.
//

import XCTest

final class LoginUITests: TestCase {
    
    private let correctLogin = "stage"
    private let correctPassword = "12345"
    private let incorrectPassword = "1"
    
    func test_loginSuccess() throws {
        launchAppWithoutLogin()

        loginPage
            .input(login: correctLogin, password: correctPassword)
            .assertNoErrorShown()
        spendsPage
            .assertIsSpendsViewAppeared()
    }
    
    func test_loginFailure() throws {
        launchAppWithoutLogin()
        
        loginPage
            .input(login: correctLogin, password: incorrectPassword)
            .assertIsLoginErrorShown()
    }
}
