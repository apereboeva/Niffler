//
//  SharedAccessibilityIdentifier.swift
//  Niffler
//
//  Created by Станислав Карпенко on 06.12.2023.
//

import Foundation

enum LoginViewIDs: String {
    case userNameTextField = "userNameTextField"
    case passwordTextField = "passwordTextField"
    case loginButton = "loginButton"
    case createAccountButton = "createAccountButton"
}

enum SpendsViewIDs: String {
    case spendsList = "spendsList"
    case addSpendButton = "addSpendButton"
    case editIcon = "editIcon"
}

enum SignUpViewIDs: String {
    case userNameSignUpTextField = "userNameSignUpTextField"
    case passwordSignUpTextField = "passwordSignUpTextField"
    case confirmPasswordTextField = "confirmPasswordTextField"
    case signUpButton = "signUpButton"
    case successfulRegistrationloginButton = "successfulRegistrationloginButton"
    case LoginError = "LoginError"
}

enum StatisticViewIDs: String {
    case statisticsTitleText = "statisticsTitleText"
}
    
enum NewSpendViewIDs: String {
    case amountField = "amountField"
    case descriptionField = "descriptionField"
    case addButton = "addButton"
}

