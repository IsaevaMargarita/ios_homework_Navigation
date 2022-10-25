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


//// 1 -property injection через публичное свойство
//protocol UserServiceProtocol {}
//
//final class UserService {}
//
//final class TestViewModel {
//    var userService: UserServiceProtocol?
//
//}
// let viewModel = TestViewModel()
//viewModel.userService = UserService()
//
//// 2 - через публичный метод
//
//protocol ViewStyleProtocol {}
//struct ViewStyle_Dark: ViewStyleProtocol {}
//
//final class TestView: UIView {
//    private var style: ViewStyleProtocol?
//
//    func apple(style: ViewStyleProtocol) {
//        self.style = style
//    }
//}
//
//let darkStyle = ViewStyle_Dark()
//let testView = TestView(frame: .zero)
//testView.apple(style: darkStyle)
//
////3 - через инициализатор
//final class TestViewModel_03 {
//
//    private let userService: UserServiceProtocol
//    private let modelID: String
//
//    init(
//        userService: UserServiceProtocol,
//        modelID: String) {
//            self.userService = userService
//            self.modelID = modelID
//        }
//}
//
//let viewModel_03 = TestViewModel_03(
//    userService: UserService(),
//    modelID: NSUUID().uuidString
//)

//
