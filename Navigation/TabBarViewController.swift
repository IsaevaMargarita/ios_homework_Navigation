//
//  TabBarViewController.swift
//  Navigation
//
//  Created by m.isaeva on 08.07.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let user: User
    
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
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
                let profileViewController = ProfileViewController(user: user)
                return wrappedInNavigationController(with: profileViewController, title: $0.title)
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
