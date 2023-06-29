//
//  AppDelegate.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/02/23.
//

import UIKit
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Configure Kingfisher's Cache
            let cache = ImageCache.default

            // Constrain Memory Cache to 10 MB
            cache.memoryStorage.config.totalCostLimit = 1024 * 1024 * 10

            // Constrain Disk Cache to 100 MB
            cache.diskStorage.config.sizeLimit = 1024 * 1024 * 100
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    var backgroundSessionCompletionHandler: (() -> Void)?
    func application(
        
        _ application: UIApplication,
        handleEventsForBackgroundURLSession
        handleEventsForBackgroundURLSessionidentifier: String,
        completionHandler: @escaping () -> Void) {
            backgroundSessionCompletionHandler = completionHandler
        }
    
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}


