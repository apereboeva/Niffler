//
//  NewSpendPage.swift
//  Niffler
//
//  Created by Анна Перебоева on 01.04.2025.
//

import XCTest

final class NewSpendPage: BasePage {
    
    @discardableResult
    func inputSpending(spending: String) -> Self {
        XCTContext.runActivity(named: "Ввожу сумму \(spending)") { _ in
            let amountField = app.textFields["amountField"]
            if amountField.waitForExistence(timeout: 5) {
            } else {
                XCTFail("Поле ввода суммы не появилось")
            }
            amountField.tap()
            amountField.typeText(spending)
        }
        return self
    }
    
    @discardableResult
    func inputDescription(description: String) -> Self  {
        XCTContext.runActivity(named: "Ввожу описание \(description)") { _ in
            let descriptionField = app.textFields["descriptionField"]
            if descriptionField.waitForExistence(timeout: 5) {
            } else {
                XCTFail("Поле ввода описания не появилось")
            }
            descriptionField.tap()
            descriptionField.typeText(description)
        }
        return self
    }
    
    func tapAddButton() {
        XCTContext.runActivity(named: "Жму кнопку добавления") { _ in
            app.buttons["addButton"].tap()
        }
    }
    
    func clearDescriptionField() -> Self {
        XCTContext.runActivity(named: "Очищаю поле описания") { _ in
            let descriptionField = app.textFields["descriptionField"]
            XCTAssertTrue(descriptionField.waitForExistence(timeout: 5), "Поле описания не найдено")

            descriptionField.tap()

            if let currentValue = descriptionField.value as? String {
                let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
                descriptionField.typeText(deleteString)
            } else {
                XCTFail("Не удалось получить текущее значение поля")
            }
        }
        return self
    }
}
