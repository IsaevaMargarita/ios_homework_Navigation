//
//  Checker.swift
//  Navigation
//
//  Created by Margarita Isaeva on 26.10.2022.
//

import Foundation

class Checker {
    static let shared = Checker()
    
    private let loginTest: String
    private let passwordTest: String
    
    private init() {
         loginTest = "Test"
         passwordTest = "123"
    }
    
    func check(login: String, password: String) -> Bool {
        login == loginTest && password == passwordTest
    }
    
}

 struct LoginInspector: LoginViewControllerDelegate {
   private let checker = Checker.shared
    
    func check(login: String, password: String) -> Bool {
        checker.check(login: login, password: password)
    }
}


