//
//  SpendsPage.swift
//  Niffler
//
//  Created by Анна Перебоева on 06.03.2025.
//

import XCTest

final class SpendsPage: BasePage {
    
    @discardableResult
    func assertIsSpendsViewAppeared(file: StaticString = #filePath, line: UInt = #line) -> Self  {
        XCTContext.runActivity(named: "Жду экран с тратами") { _ in
            waitSpendsScreen(file: file, line: line)
            XCTAssertGreaterThanOrEqual(app.scrollViews.switches.count, 1,
                                        "Не нашел трат в списке",
                                        file: file, line: line)
        }
        return self
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
    
    @discardableResult
    func tapOnPlus(file: StaticString = #filePath, line: UInt = #line) -> NewSpendPage {
        XCTContext.runActivity(named: "Тап на крестик добавления") { _ in
            let plusIcon = app.buttons["addSpendButton"]
            if plusIcon.waitForExistence(timeout: 5) {
            } else {
                XCTFail("Иконка + не найдена",
                        file: file, line: line)
            }
            plusIcon.tap()
        }
        return NewSpendPage (app: app)
    }
    
    func checkNewSpend(description: String) {
        XCTContext.runActivity(named: "Проверяю, что добавилась новая запись") { _ in
            let newSpendCell = app.tables.cells.staticTexts[description]
            XCTAssertTrue(newSpendCell.waitForExistence(timeout: 5), "Новая запись не добавлена")
            }
        }
    
    @discardableResult
    func tapOnSpend(file: StaticString = #filePath, line: UInt = #line) -> NewSpendPage {
        XCTContext.runActivity(named: "Тап на первую трату в списке") { _ in
            let editIcon = app.images.matching(identifier: "editIcon").element(boundBy: 0)
            XCTAssertTrue(editIcon.exists)
            editIcon.tap()
        }
        return NewSpendPage (app: app)
    }
    
    func tapOnFirstAndThirdCheckboxes() {
        let switches = app.scrollViews.switches
        
        let first = switches.element(boundBy: 0)
        let third = switches.element(boundBy: 2)
        
        XCTAssertTrue(first.waitForExistence(timeout: 5), "Первый чекбокс не найден")
        first.tap()
        
        XCTAssertTrue(third.waitForExistence(timeout: 5), "Третий чекбокс не найден")
        third.tap()
    }
}

