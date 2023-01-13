//
//  SceneDelegate.swift
//  WordGame
//
//  Created by Yasir Romaya on 11/18/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }

        setWindow(scene: scene)
    }
    
    @available(iOS 13.0, *)
    func setWindow(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        
        window?.rootViewController = WordsGameRouter().configuredViewController()
        window?.makeKeyAndVisible()
    }
}

