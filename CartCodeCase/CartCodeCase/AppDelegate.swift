//
//  AppDelegate.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        fireInitialWireframe()
        
        return true
    }

    private func fireInitialWireframe() {
        window?.rootViewController = Wireframes.main.value.viewController
        window?.makeKeyAndVisible()
    }
    
}

