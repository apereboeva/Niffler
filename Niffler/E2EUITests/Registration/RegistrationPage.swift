//
//  RegistrationPage.swift
//  Niffler
//
//  Created by Анна Перебоева on 05.03.2025.
//

import XCTest

private enum Constants {
    static let registrationError = "Не удалось создать пользователя"
}

class RegistrationPage: BasePage {
        
    @discardableResult
    func input(login: String, password: String, confirmPassword: String) -> Self {
        XCTContext.runActivity(named: "Регистрация \(login), \(password), \(confirmPassword)") { _ in
            input(login: login)
            input(password: password)
            input(confirmPassword: password)
            pressSignUpButton()
        }
        return self
    }
    
    private func input(login: String) {
        XCTContext.runActivity(named: "Ввожу логин \(login)") { _ in
            let userNameField = app.textFields["userNameSignUpTextField"]
            if userNameField.waitForExistence(timeout: 5) {
                userNameField.tap()
                userNameField.typeText(login)
            } else {
                XCTFail("Поле ввода логина не появилось")
            }
        }
    }
    
    private func input(password: String) {
        XCTContext.runActivity(named: "Ввожу пароль \(password)") { _ in
            let passwordSignUpTextField = app.secureTextFields["passwordSignUpTextField"]
            if passwordSignUpTextField.waitForExistence(timeout: 5) {
            } else {
                XCTFail("Поле ввода пароля не появилось")
            }
            passwordSignUpTextField.tap()
            passwordSignUpTextField.typeText(password)
        }
    }
    
    
    private func input(confirmPassword: String) {
        XCTContext.runActivity(named: "Ввожу подтверждение пароля \(confirmPassword) и закрываю клавиатуру") { _ in
            let confirmPasswordTextField = app.secureTextFields["confirmPasswordTextField"]
            if confirmPasswordTextField.waitForExistence(timeout: 5) {
            } else {
                XCTFail("Поле ввода подтверждения пароля не появилось")
            }
            confirmPasswordTextField.tap()
            confirmPasswordTextField.typeText(confirmPassword)
            app.keyboards.buttons["Return"].tap()
        }
    }
    
    private func pressSignUpButton() {
        XCTContext.runActivity(named: "Жму кнопку регистрации") { _ in
            app.buttons["signUpButton"].tap()
        }
    }
    
    func pressloginButton() {
        XCTContext.runActivity(named: "Жму кнопку авторизации на попапе успешной регстрации") { _ in
            app.buttons["successfulRegistrationloginButton"].tap()
        }
    }
    
    func assertIsRegistrationErrorShown(file: StaticString = #filePath, line: UInt = #line) {
        XCTContext.runActivity(named: "Жду сообщение с ошибкой") { _ in
            let registrationError = app.staticTexts["LoginError"]
            XCTAssertTrue(registrationError.waitForExistence(timeout: 5), "Не нашли сообщение о неудачной регистрации", file: file, line: line)
            XCTAssertEqual(registrationError.label, Constants.registrationError, "Значение  \(registrationError.label) не соотвествует \(Constants.registrationError)", file: file, line: line)
        }
    }
    
    func assertNoRegistrationErrorShown(file: StaticString = #filePath, line: UInt = #line) {
        XCTContext.runActivity(named: "Проверяем отсутствие сообщения об ошибке") { _ in
            let registrationError = app.staticTexts["LoginError"]
            XCTAssertFalse(registrationError.waitForExistence(timeout: 5),"Появилась ошибка: \(registrationError.label)", file: file, line: line)
        }
    }

}
