//
//  AppDelegate.swift
//  wageulSeoul
//
//  Created by HSH on 04/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let id = IDVerificationInfo()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Tab Bar Color Setting
        UITabBar.appearance().tintColor = UIColor.init(displayP3Red: 240.0/255.0, green: 143.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        
        //navigaion var color setting
        UINavigationBar.appearance().tintColor = UIColor.init(displayP3Red: 240.0/255.0, green: 143.0/255.0, blue: 79.0/255.0, alpha: 1.0)

        
        //Login Test
        if UserDefaults.standard.value(forKey: "FinalPhoneNum") == nil{
            switchToIDVerificationUI()
        }else{
            switchToMainUI()
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
    
    func switchToMainUI() {
        
        // window 제작
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // StoryBoard Instance
        let tutorialStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // View Controller Instance
        let viewController = tutorialStoryboard.instantiateViewController(withIdentifier: "policy")
        
        // Set Root View Controller of Window
        self.window?.rootViewController = viewController
        
        // Show Window
        self.window?.makeKeyAndVisible()
    }
    
    func switchToIDVerificationUI() {
        
        
        // window 제작
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // StoryBoard Instance
        let tutorialStoryboard = UIStoryboard(name: "IDVerification", bundle: nil)
        
        // View Controller Instance
        let viewController = tutorialStoryboard.instantiateViewController(withIdentifier: "IDVerificatonStart")
        
        // Set Root View Controller of Window
        self.window?.rootViewController = viewController
        
        // Show Window
        self.window?.makeKeyAndVisible()
    }


}

