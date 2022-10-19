//
//  TabBarViewController.swift
//  Navigation
//
//  Created by m.isaeva on 08.07.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private enum TabBarItem: Int {
        case feed
        case profile
        
        var title: String {
            switch self {
            case .feed:
                return "Feed"
            case .profile:
                return "Profile"
            }
        }
        
        var icon: String {
            switch self {
            case .feed:
                return "house.fill"
            case .profile:
                return "person.fill"
            }
        }
        
        var color: UIColor {
            switch self {
            case .feed:
                return .systemOrange
            case .profile:
                return .systemRed
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        let dataSource: [TabBarItem] = [.feed, .profile]
        viewControllers = dataSource.map {
            switch $0 {
            case .feed:
                let feedViewController = FeedViewController()
                return wrappedInNavigationController(with: feedViewController, title: $0.title)
            case .profile:
#if DEBUG
                let user = User(login: "Test", fullName: "Super Test", avatar: UIImage(named: "test")!, status: "Test")
#else
                let user = User(login: "Mario", fullName: "Super Mario", avatar: UIImage(named: "Mario")!, status: "Hello")
#endif
                let loginViewController = LogInViewController(userService: CurrentUserService(currentUser: user))
                return wrappedInNavigationController(with: loginViewController, title: $0.title)
            }
        }
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.badgeColor = dataSource[$0].color
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].icon)
            $1.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: .zero, bottom: -5, right: .zero)
        }
        
    }
    
    // MARK: - Navigation
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: with)
        navigationController.navigationBar.isTranslucent = false
//        navigationController.isNavigationBarHidden = true
        navigationController.view.backgroundColor = .assetColor
        return navigationController
    }
}

private extension UIColor {
    static let assetColor = UIColor(named: "tabbarColor") ?? .clear
}
