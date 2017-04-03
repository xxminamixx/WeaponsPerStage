//
//  HomeViewController.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class HomeViewController: UIViewController {

    /// ステージと武器を表示するTableView
    @IBOutlet weak var weaponsPerStageTableView: UITableView!
    
    /// 勝敗数を表示するView
    @IBOutlet weak var winLoseView: UIView!
    /// 勝敗ViewとTableViewとの仕切りView
    @IBOutlet weak var separatorView: UIView!
    
    /// 勝利数をカウント
    @IBOutlet weak var winCount: UILabel!
    /// 敗北数をカウント
    @IBOutlet weak var loseCount: UILabel!
    
    override func viewDidLoad() {
        // NavigationBarのタイトル
        navigationItem.title = ConstText.home
        
        // NavigationBarの高さをセット
        if let height = navigationController?.navigationBar.frame.size.height {
            DeviceSizeManager.sharedInstance.naviBarHeight = height
        }
        
        // TabBarの高さをセット
        if let height = tabBarController?.tabBar.frame.size.height {
             DeviceSizeManager.sharedInstance.tabBarHeight = height
        }
        
        // 勝敗Viewの高さをセット
        DeviceSizeManager.sharedInstance.winLoseViewHeight = winLoseView.frame.size.height
        
        // 仕切りViewの色設定
        separatorView.backgroundColor = ConstColor.yellowGreen
        
        // キャプチャボタンをNavigationBarの右に追加
        let rightCaptureButtonItem: UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "Capture.png"), style: .plain, target: self, action: #selector(capture))
        self.navigationItem.setRightBarButtonItems([rightCaptureButtonItem], animated: true)
        
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
        // 勝敗ラベルを更新
        winLoseCountLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func winLoseCountLoad() {
        self.winCount.text = WeaponsPerStageStoreManager.winCount().description
        self.loseCount.text = WeaponsPerStageStoreManager.loseCount().description
    }
    
    
    /// キャプチャボタンを押したときに呼び出され、TableViewをキャプチャする
    func capture() {
        // TableViewのスクロールを最上に戻す
        weaponsPerStageTableView.contentOffset = CGPoint(x: 0, y: -weaponsPerStageTableView.contentInset.top)
        
        if let image = self.weaponsPerStageTableView.captureImage() {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(didFinishWriteImage(_:error:contextInfo:)), nil)
        }
    }
    
    func didFinishWriteImage(_ image: UIImage, error: NSError?, contextInfo: UnsafeMutableRawPointer) {
        if let error = error {
            print("Image write error: \(error)")
        } else {
            // アラート表示
            let alertController = UIAlertController(title: nil, message: "キャプチャに成功しました", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "とじる", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
}

        
// MARK: - TableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: ステージの個数と武器の個数が同じなので今はステージの個数を参照他にいい方法あればそちらに変更したい
        return DataSource.stageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WaponsPerStageTableViewCell.nibName, for: indexPath) as! WaponsPerStageTableViewCell
        // TODO: 強制アンラップしているが、nil判定が必要
        let weaponStage = WeaponsPerStageStoreManager.weaponsPerStageList()[indexPath.row]
        cell.setup(stage: weaponStage.stage!, weapon:
            weaponStage.weapon!, weaponIcon: weaponStage.weaponIcon!, subWeapon: weaponStage.subWeapon!, specialWeapon: weaponStage.specialWeapon!, winlose: weaponStage.winlose!, indexPath: indexPath, completion: {
            self.winCount.text = WeaponsPerStageStoreManager.winCount().description
            self.loseCount.text = WeaponsPerStageStoreManager.loseCount().description
        })
        
        cell.buttonColorSwitch()
        return cell
    }
}

        
// MARK: - TableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: カスタムセルの高さを固定にしているため定数にしているが、変更に対応できるように変数にしたい
        return 100
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ContainViewController")
        // どのセルをタップして遷移したかを保持
        // TODO: この方法は微妙なのであとでスマートな方法を考える
        IndexManager.indexPath = indexPath
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
