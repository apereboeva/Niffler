//
//  XCUIElement+Actions.swift
//  Niffler
//
//  Created by Анна Перебоева on 16.03.2025.
//

import XCTest

extension XCUIElement {
    
    func tap(_ element: XCUIElement) {
        guard element.waitForExistence(timeout: 10) else {
            XCTFail("Элемент: \(self) не существует")
            return
        }
        element.tap()
    }
}
