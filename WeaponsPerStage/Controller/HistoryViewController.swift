//
//  HistoryViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/05/22.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "履歴"
        
        // TableViewの初期設定
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: HistoryTableViewCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: HistoryTableViewCell.nibName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}


// MARK: - TableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeaponsPerStageStoreManager.historyCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.nibName, for: indexPath) as! HistoryTableViewCell
        
        let history = WeaponsPerStageStoreManager.historyList()[indexPath.row]
        
        cell.setup(history: history)
        
        return cell
    }
    
}


// MARK: - TableViewDelegate
extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        // タップしたセルのデータをHomeViewControllerのインスタンス変数に格納
        let history = WeaponsPerStageStoreManager.historyList()[indexPath.row]
        let entityList = history.weaponsPerStageEntityList
        
        if let winCount = WeaponsPerStageStoreManager.historyList()[indexPath.row].winCount() {
            // UIの更新に関わるためmainスレッドで処理
            DispatchQueue.main.async {
                viewController.winCount.text = String(winCount)
            }
        } else {
            DispatchQueue.main.async {
                viewController.winCount.text = "0"
            }
        }
        
        if let loseCount = WeaponsPerStageStoreManager.historyList()[indexPath.row].loseCount() {
            DispatchQueue.main.async {
                viewController.loseCount.text = String(loseCount)
            }
        } else {
            DispatchQueue.main.async {
                viewController.loseCount.text = "0"
            }
        }
        
        // 履歴のWeaponsPerStageを遷移先にセット
        for entity in entityList {
            viewController.weaponsePerStageList?.append(entity)
        }

        // 遷移先のタイトルを日時に変更
        ConstText.home = history.date!
        
        // HomeViewControllerにpushで画面遷移
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
