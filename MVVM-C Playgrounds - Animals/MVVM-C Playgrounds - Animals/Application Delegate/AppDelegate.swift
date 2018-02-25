//
//  AppDelegate.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinatorRepresentable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow()
        guard let window = window else { return false }
        
        applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator?.startCoordinator()
        return true
    }
}

