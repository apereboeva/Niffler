//
//  SpendsPage.swift
//  Niffler
//
//  Created by Анна Перебоева on 06.03.2025.
//

import XCTest

class SpendsPage: BasePage {
    func assertIsSpendsViewAppeared(file: StaticString = #filePath, line: UInt = #line) {
        XCTContext.runActivity(named: "Жду экран с тратами") { _ in
            waitSpendsScreen(file: file, line: line)
            XCTAssertGreaterThanOrEqual(app.scrollViews.switches.count, 1,
                                        "Не нашел трат в списке",
                                        file: file, line: line)
        }
    }
    
    @discardableResult
    func waitSpendsScreen(file: StaticString = #filePath, line: UInt = #line) -> Self {
        let isFound = app.firstMatch
            .scrollViews.firstMatch
            .switches.firstMatch
            .waitForExistence(timeout: 10)
        
        XCTAssertTrue(isFound,
                      "Не дождались экрана со списком трат",
                      file: file, line: line)
        
        return self
    }
}

