//
//  WeaponsSelectionViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class WeaponsSelectionViewController: UIViewController {

    @IBOutlet weak var weaponsTableView: UITableView!
    
    override func viewDidLoad() {
        weaponsTableView.dataSource = self
        weaponsTableView.delegate = self
        let nib = UINib.init(nibName: WeaponsTableViewCell.nibName, bundle: nil)
        weaponsTableView.register(nib, forCellReuseIdentifier: WeaponsTableViewCell.nibName)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension WeaponsSelectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 武器個数
        return JsonManager.CountAllWeapons()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  WeaponsTableViewCell.nibName, for: indexPath) as! WeaponsTableViewCell
        cell.setup(weapon: JsonManager.weaponsName()[indexPath.row])
        return cell
    }
}

extension WeaponsSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // タップした武器名をDatasouceの武器名とする
        DataSource.weaponsList[indexPath.row] = JsonManager.weaponsName()[indexPath.row]
        
        // ポップして前画面に戻る
        navigationController?.popViewController(animated: true)

    }
}
