//
//  AppDelegate.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
// for a small hint =)
//        print(Fibonacci.getFibonacciArray(fromStartInt: true, to: 20, with: nil)!)
//        print("\r__________-")
//        print(Fibonacci.getFibonacciArray(fromStartInt: false, to: 20, with: [2584,4181])!)
//        var first = Fibonacci.getFibonacciArray(fromStartInt: true, to: 20, with: nil)!
//        let second = Fibonacci.getFibonacciArray(fromStartInt: false, to: 20, with: [2584,4181])!
//        first.removeLast()
//        first.removeLast()
//        print("\r------")
//        first.append(contentsOf: second)
//        print("------>>>\(first)<<-----")
//        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

