//
//  User.swift
//  Navigation
//
//  Created by m.isaeva on 17.10.2022.
//

import Foundation
import UIKit



final class User {
var login: String
var fullName: String
var avatar: UIImage?
var status: String
    
    init(
        login: String,
        fullName: String,
        avatar: UIImage?,
        status: String
    ) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

protocol UserServiceProtocol {
    func authorization(login: String) -> User?
}

final class CurrentUserService: UserServiceProtocol {
    private let currentUser: User
    
    init( currentUser: User
    ) {
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
