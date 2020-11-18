//
//  AppDelegate.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 21.10.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    

    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        let viewController = ViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        self.window = UIWindow() //frame: UIScreen.main.bounds
        self.window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = navigationController
        

        return true
    }
}

