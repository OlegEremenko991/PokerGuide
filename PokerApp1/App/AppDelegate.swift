//
//  AppDelegate.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit
import Intercom

fileprivate let INTERCOM_APP_ID = "yourIDhere"
fileprivate let INTERCOM_API_KEY = "someKey"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Intercom.setApiKey(INTERCOM_API_KEY, forAppId: INTERCOM_APP_ID)
        Intercom.registerUnidentifiedUser()

        return true
    }

    
    // Show Intercom when "chat" tabbar is tapped, close "chat" tabbar immediately after closing Intercom
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.viewControllers?[3] {
            DispatchQueue.main.async { Intercom.presentMessenger() }
            return false
        } else {
            return true
        }
    }
}

