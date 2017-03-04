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
        let alertController = UIAlertController(title: nil, message: "初期化に成功しました", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "とじる", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
            // タブ切り替え処理
            self.tabBarController?.selectedIndex = 0
        })
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    /// 勝敗ボタンの色を初期化
    @IBAction func formatWinLose(_ sender: Any) {
        WeaponsPerStageStoreManager.winloseInit()
        self.tabBarController?.selectedIndex = 0
    }
}
