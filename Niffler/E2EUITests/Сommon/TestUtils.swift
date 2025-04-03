//
//  TestUtils.swift
//  Niffler
//
//  Created by Анна Перебоева on 02.04.2025.
//
import Foundation

extension UUID {
    static var random: String {
        UUID().uuidString.components(separatedBy: "-").first!
    }
}
