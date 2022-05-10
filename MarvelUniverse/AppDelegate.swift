//
//  AppDelegate.swift
//  MarvelUniverse
//
//  Created by Mangust on 29.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        let applicationCoordinator = ApplicationCoordinator(navigationController: navigationController)
        applicationCoordinator.start()

        window = UIWindow(frame: navigationController.view.frame)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
    
}

