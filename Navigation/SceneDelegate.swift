//
//  SceneDelegate.swift
//  Navigation
//
//  Created by m.isaeva on 26.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    let factory = MyLoginFactory()
    
#if DEBUG
    let userService = TestUserService()
#else
    let userService = CurrentUserService()
#endif
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let loginViewController = UINavigationController(rootViewController: LogInViewController(
            userService: userService,
            loginDelegate: factory.makeLoginInspector())
        )
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

