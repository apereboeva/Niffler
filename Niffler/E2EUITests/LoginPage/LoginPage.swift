//
//  LoginPage.swift
//  Niffler
//
//  Created by Анна Перебоева on 04.03.2025.
//

import XCTest

private enum Constants {
    static let authorizationError = "Нет такого пользователя. Попробуйте другие данные"
}

class LoginPage: BasePage {
    
    @discardableResult
    func input(login: String, password: String) -> Self {
        XCTContext.runActivity(named: "Авторизуюсь \(login), \(password)") { _ in
            input(login: login)
            input(password: password)
            pressLoginButton()
        }
        return self
    }
    
    private func input(login: String) {
        XCTContext.runActivity(named: "Ввожу логин \(login)") { _ in
            let userNameField = app.textFields["userNameTextField"]
            if userNameField.waitForExistence(timeout: 5) {
            } else {
                XCTFail("Поле ввода логина не появилось")
            }
            userNameField.tap()
            userNameField.typeText(login)
        }
    }
    
    private func input(password: String) {
        XCTContext.runActivity(named: "Ввожу пароль \(password)") { _ in
            let passwordTextField = app.secureTextFields["passwordTextField"]
            if passwordTextField.waitForExistence(timeout: 5) {
            } else {
                XCTFail("Поле ввода пароля не появилось")
            }
            passwordTextField.tap()
            passwordTextField.typeText(password)
        }
    }
    
    private func pressLoginButton() {
        XCTContext.runActivity(named: "Жму кнопку логина") { _ in
            app.buttons["loginButton"].tap()
        }
    }
    
    func assertIsLoginErrorShown(file: StaticString = #filePath, line: UInt = #line) {
        XCTContext.runActivity(named: "Жду сообщение с ошибкой") { _ in
            let authorizationError = app.staticTexts["LoginError"]
            XCTAssertTrue(authorizationError.waitForExistence(timeout: 5), "Не нашли сообщение о неудачной авторизации", file: file, line: line)
            XCTAssertEqual(authorizationError.label, Constants.authorizationError, file: file, line: line)
        }
    }
    
    func assertNoErrorShown(file: StaticString = #filePath, line: UInt = #line) {
        XCTContext.runActivity(named: "Проверяем отсутствие сообщения об ошибке") { _ in
            let authorizationError = app.staticTexts["LoginError"]
            XCTAssertFalse(authorizationError.waitForExistence(timeout: 5),"Появилась ошибка: \(authorizationError.label)", file: file, line: line)
        }
    }
    
    @discardableResult
    func openRegistrationScreen() -> RegistrationPage {
        XCTContext.runActivity(named: "Жму кнопку для перехода на экран авторизации") { _ in
            app.staticTexts["createAccountButton"].tap()
        }
        return RegistrationPage (app: app)
    }
}

