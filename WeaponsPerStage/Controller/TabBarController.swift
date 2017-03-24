//
//  TabBarController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/21.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タブバーの色を設定
        tabBar.barTintColor = UIColor.white
        // 選択時の色を設定
        UITabBar.appearance().tintColor = ConstColor.yellowGreen
        // 非選択時の色を設定
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        // TabBarのアイコン設定
        tabBar.items?[0].image = UIImage.init(named: "home.png")
        tabBar.items?[1].image = UIImage.init(named: "config.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
} 