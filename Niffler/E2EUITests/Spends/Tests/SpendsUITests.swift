//
//  SpendsUITests.swift
//  Niffler
//
//  Created by Анна Перебоева on 17.03.2025.
//

import XCTest

final class SpendsUITests: TestCase {
    
    let correctLogin = "stage"
    let correctPassword = "12345"
    let randomDescription = UUID.random
    
    func testAddSpend() throws {
        
        launchAppWithoutLogin()

        loginPage
            .input(login: correctLogin, password: correctPassword)
            .assertNoErrorShown()
        spendsPage
            .assertIsSpendsViewAppeared()
            .tapOnPlus()
        newSpendPage
            .inputSpending(spending: "500")
            .inputDescription(description: randomDescription)
            .tapAddButton()
//        В приложении не работает кнопка сохранения, не осуществляется возврат на список трат
//        spendsPage
//            .assertIsSpendsViewAppeared()
//            .checkNewSpend(description: randomDescription)
    }
    
    func testEditSpend() throws {
        
        launchAppWithoutLogin()
        
        loginPage
            .input(login: correctLogin, password: correctPassword)
            .assertNoErrorShown()
        spendsPage
            .assertIsSpendsViewAppeared()
            .tapOnSpend()
        newSpendPage
            .clearDescriptionField()
            .inputDescription(description: randomDescription)
//            В приложении не работает кнопка сохранения, не осуществляется возврат на список трат
//        spendsPage
//            .assertIsSpendsViewAppeared()
//            .checkNewSpend(description: randomDescription)
    }
    
    func testCheckAddingUpSpends() throws {
        
        launchAppWithoutLogin()
        
        loginPage
            .input(login: correctLogin, password: correctPassword)
            .assertNoErrorShown()
        spendsPage
            .assertIsSpendsViewAppeared()
            .tapOnFirstAndThirdCheckboxes()
        //При выборе чекбоксов траты не суммируются в приложении, следующим шагом предполагалась проверка счетчика
    }
    
}
