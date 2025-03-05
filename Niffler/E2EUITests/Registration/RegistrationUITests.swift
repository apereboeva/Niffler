//
//  RegistrationUITests.swift
//  Niffler
//
//  Created by Анна Перебоева on 05.03.2025.
//

import XCTest

final class RegistrationUITests: TestCase {
    
    private let correctLogin = UUID.randomPart
    private let correctPassword = "12345"
    private let incorrectLogin = "stage"

    //TODO разобратся почему после закрытия симулятора, нужно провести махинации с настройкой клавы в симуляторе чтобы можно было корректно вставить значения в поля 
    
    func test_registrationSuccess() throws {
        launchAppWithoutLogin()

        loginPage
            .openRegistrationScreen()
        registrationPage
            .input(login: correctLogin, password: correctPassword, confirmPassword: correctPassword)
            .pressloginButton()
    }
    
    func test_registrationFailure() throws {
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
