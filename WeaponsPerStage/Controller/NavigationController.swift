//
//  NavigationController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/03.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        navigationBar.barTintColor = ConstColor.iconGreen
        
        //NavigationBarの透明度を消す
        navigationController?.navigationBar.isTranslucent = false
        //NavigationBarに乗っている部品の色を白にする
        navigationController?.navigationBar.tintColor = UIColor.white
        
        //タイトル用の色および書式の設定
        let attrsMainTitle = [
            NSForegroundColorAttributeName : UIColor.white,
            NSFontAttributeName : UIFont(name: "Georgia-Bold", size: 15)!
        ]
        navigationBar.titleTextAttributes = attrsMainTitle
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
