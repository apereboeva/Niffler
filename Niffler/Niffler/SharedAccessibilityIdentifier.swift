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

enum DetailSpendViewIDs: String {
    case addButton = "addButton"
}
