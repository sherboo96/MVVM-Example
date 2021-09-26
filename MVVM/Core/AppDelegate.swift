//
//  AppDelegate.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 26/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = HomeVC()
        window?.makeKeyAndVisible()
        return true
    }
    
}

