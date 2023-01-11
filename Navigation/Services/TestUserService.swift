//
//  TestUserService.swift
//  Navigation
//
//  Created by m.isaeva on 19.10.2022.
//

import Foundation
import UIKit

class TestUserService: UserServiceProtocol {
    private let user: User
    
    init( user: User = User(login: "Test", fullName: "Super Test", avatar: UIImage(named: "test"), status: "Test")) {
        self.user = user
    }
    
    func authorization(login: String) -> User? {
        
        if login == user.login {
            return user
        } else {
            return nil
        }
    }
}


