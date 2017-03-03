//
//  ViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// ステージと武器を表示するTableView
    @IBOutlet weak var weaponsPerStageTableView: UITableView!
    
    override func viewDidLoad() {
        // NavigationBarのタイトル
        navigationItem.title = "イカウェポナー"
        
        // ステージと武器一覧のTableViewの初期設定
        weaponsPerStageTableView.dataSource = self
        weaponsPerStageTableView.delegate = self
        let nib = UINib.init(nibName: WaponsPerStageTableViewCell.nibName, bundle: nil)
        weaponsPerStageTableView.register(nib, forCellReuseIdentifier: WaponsPerStageTableViewCell.nibName)
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 武器選択画面から戻ってきたときにTableView更新
        weaponsPerStageTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

        
// MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: ステージの個数と武器の個数が同じなので今はステージの個数を参照他にいい方法あればそちらに変更したい
        return DataSource.stageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WaponsPerStageTableViewCell.nibName, for: indexPath) as! WaponsPerStageTableViewCell
        // TODO: 引数が長いので外出ししてスマートにしたい
        cell.setup(stage: DataSource.stageList[indexPath.row], weapon: DataSource.weaponsList[indexPath.row])
        return cell
    }
}

        
// MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: カスタムセルの高さを固定にしているため定数にしているが、変更に対応できるように変数にしたい
        return 50
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "WeaponsSelectionViewController")
        // どのセルをタップして遷移したかを保持
        // TODO: この方法は微妙なのであとでスマートな方法を考える
        IndexManager.indexPath = indexPath
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
