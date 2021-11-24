//
//  AppDelegate.swift
//  TralaExample
//
//  Created by Joshua Emmons on 11/1/21.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    public let peopleFetcher = PeopleFetcher()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        if ProcessInfo.processInfo.environment["TESTING"] == nil,
           let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
            if let accepting = rootVC as? AcceptsPeopleAPI {
                accepting.accept(peopleAPI: peopleFetcher)
            }
            window?.rootViewController = rootVC
        } else {
            window?.rootViewController = UIViewController()
        }
        window?.makeKeyAndVisible()
        return true
    }
}

