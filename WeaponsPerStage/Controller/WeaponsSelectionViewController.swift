//
//  WeaponsSelectionViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class WeaponsSelectionViewController: UIViewController {

    /// 武器選択のテーブルビュー
    @IBOutlet weak var weaponsTableView: UITableView!
    
    override func viewDidLoad() {
        // NavigationBarのタイトル
        navigationItem.title = ConstText.weaponsSelection
        
        // 武器名配列を初期化
        DataSource.weaponNameList = JsonManager.weaponsName()
        
        // tableView初期設定
        weaponsTableView.dataSource = self
        weaponsTableView.delegate = self
        let nib = UINib.init(nibName: WeaponsTableViewCell.nibName, bundle: nil)
        weaponsTableView.register(nib, forCellReuseIdentifier: WeaponsTableViewCell.nibName)
        
        slideMenuController()?.delegate = self
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard weaponsTableView != nil else {
            return
        }
        
        weaponsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


// MARK: - TableViewDataSource
extension WeaponsSelectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 武器個数
        return JsonManager.CountAllWeapons()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  WeaponsTableViewCell.nibName, for: indexPath) as! WeaponsTableViewCell
        cell.setup(weapon: (DataSource.weaponNameList?[indexPath.row])!)
        return cell
    }
}


// MARK: - TableViewDelegate
extension WeaponsSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: カスタムセルの高さを固定にしているため定数にしているが、変更に対応できるように変数にしたい
        return 50
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // タップした武器名をからDataSourceの武器名、サブ名、スペシャル名を、武器アイコンを変更
        let weaponStage = WeaponsPerStageStoreManager.weaponsPerStageList()[IndexManager.indexPath.row]
        WeaponsPerStageStoreManager.save(closure: {
            weaponStage.weapon = JsonManager.weaponsName()[indexPath.row]
            weaponStage.subWeapon = JsonManager.subWeaponsNameList()[indexPath.row]
            weaponStage.specialWeapon = JsonManager.specialWeaponsList()[indexPath.row]
            
            if let weaponIcon = DataSource.weaponsIconRelation[JsonManager.weaponsName()[indexPath.row]] {
                // データソースから武器アイコンをセットする
                weaponStage.weaponIcon = weaponIcon
            }
            
        })
        
        // ポップして前画面に戻る
        _ = navigationController?.popToRootViewController(animated: true)
    }
}

extension WeaponsSelectionViewController: SlideMenuControllerDelegate {
    
    func rightDidOpen() {
        // 武器マスタの初期化
        DataSource.masterWeaponList = JsonManager.weaponsList()	
    }
    
    func rightDidClose() {
        weaponsTableView.reloadData()
    }
}
