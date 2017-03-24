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
        
        // 初期データ流し込み
        JsonManager.initUserData()
        
//        WeaponsPerStageStoreManager.DeleteAll()
//        let ud = UserDefaults.standard
//        if ud.bool(forKey: "firstLaunch") {
//            // 起動時にjsonマスタデータをRealmで永続化
//            JsonManager.initUserData()
//            ud.set(false, forKey: "firstLaunch")
//        }
        
        // スライダー初期設定
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let homeViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! WeaponsSelectionViewController

//        let selectionViewController = storyboard.instantiateViewController(withIdentifier: "WeaponsSelectionViewController") as! WeaponsSelectionViewController
//        let sortViewController = storyboard.instantiateViewController(withIdentifier: "SortViewController") as! SortViewController
//        
//        let nvc: UINavigationController = UINavigationController(rootViewController: selectionViewController)
//        
//        
//        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: sortViewController, rightMenuViewController: sortViewController)
//        
//        self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
////        self.window?.rootViewController = slideMenuController
//        self.window?.makeKeyAndVisible()

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

