//
//  BaseTestCase.swift
//  Niffler
//
//  Created by Анна Перебоева on 04.03.2025.
//

import XCTest

class TestCase: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
    }
    
    override func tearDown() {
        app = nil
        
        loginPage = nil
        spendsPage = nil
        newSpendPage = nil
        
        super.tearDown()
    }
    
    func launchAppWithoutLogin() {
        XCTContext.runActivity(named: "Запускаю приложение в режиме 'без авторизации'") { _ in
            app.launchArguments = ["RemoveAuthOnStart"]
            app.launch()
        }
    }
    
    lazy var loginPage: LoginPage! = LoginPage(app: app)
    lazy var registrationPage: RegistrationPage! = RegistrationPage(app: app)
    lazy var spendsPage: SpendsPage! = SpendsPage(app: app)
    lazy var newSpendPage: NewSpendPage! = NewSpendPage(app: app)
}


