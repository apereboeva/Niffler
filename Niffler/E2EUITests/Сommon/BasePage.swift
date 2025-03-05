//
//  BasePage.swift
//  Niffler
//
//  Created by Анна Перебоева on 04.03.2025.
//

import XCTest

class BasePage {
    init(app: XCUIApplication) {
        self.app = app
    }
    
    let app: XCUIApplication
    
    func tap(_ element: XCUIElement) {
            guard element.waitForExistence(timeout: 10) else {
                XCTFail("Элемент: \(self) не существует")
                return
            }
            element.tap()
    }
    
}
