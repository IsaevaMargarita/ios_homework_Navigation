//
//  User.swift
//  Navigation
//
//  Created by Margarita Isaeva on 02.11.2022.
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
