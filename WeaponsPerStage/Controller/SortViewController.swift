//
//  SortViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/21.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class SortViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        // TableViewの初期設定
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib.init(nibName: WeaponsTableViewCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: WeaponsTableViewCell.nibName)
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - TableViewDataSource
extension SortViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.weaponType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  WeaponsTableViewCell.nibName, for: indexPath) as! WeaponsTableViewCell
        cell.setup(weapon: DataSource.weaponType[indexPath.row])
        
        if indexPath.row == 0 {
            cell.backgroundColor = ConstColor.gray_e8e8e8
        }
        
        return cell
    }
}


// MARK: - TableViewDelegate
extension SortViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        if DataSource.weaponType[indexPath.row] == "すべて表示" {
            // 武器名DataSourceのfilterを外し全武器格納
            DataSource.weaponNameList = JsonManager.weaponsName()
        } else {
            // 選択した武器種でfilter
            DataSource.masterWeaponList = DataSource.masterWeaponList?.filter({$0["type"] == DataSource.weaponType[indexPath.row] })
            DataSource.weaponNameList = JsonManager.weaponsName()
        }

        WeaponsSelectHandlingManager.isSort = true
        self.slideMenuController()?.closeRight()
    }
}
