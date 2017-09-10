//
//  AppDelegate.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-09.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import UIKit
import algorithmia

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static let client = Algorithmia.client(simpleKey: "sim+LlkWn9DHbQcXkiK8W8l1PQP1")
    
    static var storage: AlgoDataDirectory!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let tabBarController = window?.rootViewController as? UITabBarController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let pictureViewController = storyboard.instantiateViewController(withIdentifier: "PictureNavController")
            pictureViewController.tabBarItem = UITabBarItem(title: "Photo", image: #imageLiteral(resourceName: "photo"), tag: 1)
            tabBarController.viewControllers?.append(pictureViewController)
            
            let cameraViewController = storyboard.instantiateViewController(withIdentifier: "CameraNavController")
            cameraViewController.tabBarItem = UITabBarItem(title: "Camera", image: #imageLiteral(resourceName: "camera"), tag: 2)
            tabBarController.viewControllers?.append(cameraViewController)
        }
        
        AppDelegate.storage = AppDelegate.client.dir("data://.my/storage")
        AppDelegate.storage.create { error in
            print("CREATE ERROR: \(String(describing: error))")
        }


        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

