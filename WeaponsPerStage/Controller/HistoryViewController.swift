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
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


// MARK: - TableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeaponsPerStageStoreManager.historyCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* TODO: 
         カスタムセルを考えて作成
         いつWeaponsePerEntityを永続化するのか
         セルをタップしたとき何をするのか
         */
        let cell = tableView.dequeueReusableCell(withIdentifier: WaponsPerStageTableViewCell.nibName, for: indexPath) as! WaponsPerStageTableViewCell
        return cell
    }
    
}


// MARK: - TableViewDelegate
extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {}
    
}
