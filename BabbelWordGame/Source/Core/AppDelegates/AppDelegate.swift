//
//  AppDelegate.swift
//  BabbelWordGame
//
//  Created by Yasir Romaya on 11/18/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = WordsGameRouter().configuredViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

