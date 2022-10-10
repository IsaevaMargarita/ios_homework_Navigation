//
//  SceneDelegate.swift
//  Navigation
//
//  Created by m.isaeva on 26.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TabBarViewController()
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

