//
//  AppDelegate.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All 	rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let ud = UserDefaults.standard
        
        // デバッグ用
//        JsonManager.initUserData()
//                WeaponsPerStageStoreManager.DeleteAll()
        
        if ud.bool(forKey: "firstLaunch") {
            // 起動時にjsonマスタデータをRealmで永続化
            JsonManager.initUserData()
            ud.set(false, forKey: "firstLaunch")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

