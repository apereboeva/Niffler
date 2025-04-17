//
//  LoginUITests.swift
//  Niffler
//
//  Created by Анна Перебоева on 04.03.2025.
//

import XCTest

final class LoginUITests: TestCase {
    
    func testLoginSuccess() throws {
        name("Открытие ссылки - matthewfetcher.com")
        description("Логин успешен")
        owner("b.lysikov")
        epic("Экран инфор Радио")
        feature("Ссылка на сайт")
        story("Открытие ссылки")
        tags(["tag1", "tag2"])
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
    
    func testGoLoginFromRegistrationScreen() throws {
        
        launchAppWithoutLogin()
        XCTFail("Failed")
    }
}
