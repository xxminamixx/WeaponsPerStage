//
//  ContainViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/24.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ContainViewController: SlideMenuController {
    
    override func awakeFromNib() {
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "WeaponsSelectionViewController") {
            self.mainViewController = controller
        }
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SortViewController") {
            self.rightViewController = controller
        }
        
        super.awakeFromNib()
    }

    override func viewDidLoad() {

        //タイトル用の色および書式の設定
        let attrsMainTitle = [
            NSForegroundColorAttributeName : UIColor.white,
            NSFontAttributeName : UIFont(name: "Georgia-Bold", size: 15)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrsMainTitle
        
        // NavigationBarにボタン追加
        self.addRightBarButtonWithImage(UIImage(named: "Sort.png")!)
        // バックボタン文字を変更
        self.navigationItem.backBarButtonItem?.title = "<"
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
