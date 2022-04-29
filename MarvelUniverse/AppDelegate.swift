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
        let navigation = UINavigationController(rootViewController: MainViewController())

        window = UIWindow(frame: navigation.view.frame)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()

        return true
    }

}

