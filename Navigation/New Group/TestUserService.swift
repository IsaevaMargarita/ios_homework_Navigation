//
//  TestUserService.swift
//  Navigation
//
//  Created by m.isaeva on 19.10.2022.
//

import Foundation

class TestUserService: UserServiceProtocol {
    private let testUser: User
    
    init( testUser: User
    ) {
        self.testUser = testUser
    }
    
    func authorization(login: String) -> User? {
        
        if login == testUser.login {
            return testUser
        } else {
            return nil
        }
    }
}
