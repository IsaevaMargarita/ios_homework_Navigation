//
//  LoginFactory.swift
//  Navigation
//
//  Created by Margarita Isaeva on 31.10.2022.
//

import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector{
       return LoginInspector()
    }
}


