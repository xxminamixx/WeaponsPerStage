//
//  ViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // TODO: 名前のスペルミスと頭文字大文字を小文字に修正
    @IBOutlet weak var WaponsPerStageTableView: UITableView!
    
    override func viewDidLoad() {
        WaponsPerStageTableView.dataSource = self
        WaponsPerStageTableView.delegate = self
        let nib = UINib.init(nibName: WaponsPerStageTableViewCell.nibName, bundle: nil)
        WaponsPerStageTableView.register(nib, forCellReuseIdentifier: WaponsPerStageTableViewCell.nibName)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 武器個数
        return JsonManager.CountAllWeapons()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WaponsPerStageTableViewCell.nibName, for: indexPath) as! WaponsPerStageTableViewCell
        cell.setup(stage: DataSource.stageList[indexPath.row], weapon: DataSource.weaponsList[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "WeaponsSelectionViewController")
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
