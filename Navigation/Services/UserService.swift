//
//  UserService.swift
//  Navigation
//
//  Created by Margarita Isaeva on 01.11.2022.
//

import Foundation
import UIKit

protocol UserServiceProtocol {
    func authorization(login: String) -> User?
}

final class CurrentUserService: UserServiceProtocol {
    private let currentUser: User
    
    init( currentUser: User = User(login: "Mario", fullName: "Super Mario", avatar: UIImage(named: "Mario")!, status: "Hello")) {
        self.currentUser = currentUser
    }
    
    func authorization(login: String) -> User? {
        
        if login == currentUser.login {
            return currentUser
        } else {
            return nil
        }
    }
}
