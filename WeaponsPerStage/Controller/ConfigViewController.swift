//
//  ConfigViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/03.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = ConstText.config
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func format(_ sender: Any) {
        
        // 全データ削除
        WeaponsPerStageStoreManager.DeleteAll()
        // 初期データを流し込む
        JsonManager.initUserData()
        
        // アラート表示
        present(AlertControllerManager.customActionAlert(title: nil, message: "初期化に成功しました", defaultAction: {_ in
            // タブ切り替え処理
            self.tabBarController?.selectedIndex = 0
        }), animated: true, completion: nil)
    }
    
    /// 勝敗ボタンの色を初期化
    @IBAction func formatWinLose(_ sender: Any) {
        WeaponsPerStageStoreManager.winloseInit()
        self.tabBarController?.selectedIndex = 0
        
        // アラート表示
        present(AlertControllerManager.customActionAlert(title: nil, message: "勝敗の初期化に成功しました", defaultAction: {_ in
            // タブ切り替え処理
            self.tabBarController?.selectedIndex = 0
        }), animated: true, completion: nil)

    }
    
    @IBAction func formatSetWeapon(_ sender: Any) {
    }
    
    @IBAction func formatFavorite(_ sender: Any) {
    }
}
