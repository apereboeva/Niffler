//
//  RegistrationUITests.swift
//  Niffler
//
//  Created by Анна Перебоева on 05.03.2025.
//

import XCTest

final class RegistrationUITests: TestCase {
    
    private let correctPassword = "12345"

    //TODO разобратся почему после закрытия симулятора, нужно провести махинации с настройкой клавы в симуляторе чтобы можно было корректно вставить значения в поля 
    
    func testRegistrationSuccess() throws {
        
        let correctLogin = UUID.randomPart
        
        launchAppWithoutLogin()

        loginPage
            .openRegistrationScreen()
        registrationPage
            .input(login: correctLogin, password: correctPassword, confirmPassword: correctPassword)
            .pressloginButton()
    }
    
    func testRegistrationFailure() throws {
        
        let incorrectLogin = "stage"
        
        launchAppWithoutLogin()
        
        loginPage
            .openRegistrationScreen()
        registrationPage
            .input(login: incorrectLogin, password: correctPassword, confirmPassword: correctPassword)
            .assertIsRegistrationErrorShown()
    }
}

extension UUID {
    static var randomPart: String {
        UUID().uuidString.components(separatedBy: "-").first!
    }
}
