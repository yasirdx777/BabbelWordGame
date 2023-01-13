//
//  AppDelegate.swift
//  WordGame
//
//  Created by Yasir Romaya on 11/18/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13, *) {return true}
        setWindow()
        
        return true
    }
    
    func setWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = WordsGameRouter().configuredViewController()
        window?.makeKeyAndVisible()
    }

}

