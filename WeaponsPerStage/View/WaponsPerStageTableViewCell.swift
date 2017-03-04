//
//  WaponsPerStageTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class WaponsPerStageTableViewCell: UITableViewCell {

    /// セルID
    static let nibName = "WaponsPerStageTableViewCell"
    var winloseStatus = "both"
    var indexPath: IndexPath = [0, 0]
    
    /// ステージ名ラベル
    @IBOutlet weak var stage: UILabel!
    /// 武器名ラベル
    @IBOutlet weak var weapon: UILabel!
    /// サブ名ラベル
    @IBOutlet weak var subWeapon: UILabel!
    /// スペシャル名ラベル
    @IBOutlet weak var specialWeapon: UILabel!
    /// 武器画像
    @IBOutlet weak var weaponImage: UIImageView!
    /// winボタン
    @IBOutlet weak var winButton: UIButton!
    /// loseボタン
    @IBOutlet weak var loseButton: UIButton!
    
    override func awakeFromNib() {
        // 初期読み込み時は両方のボタンをグレーにする
        buttonColorSwitch()
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// 自身のプロパティに値をセットする
    ///
    /// - Parameters:
    ///   - stage: ステージ名
    ///   - weapon: 武器名
    ///   - subWeapon: サブ名
    ///   - specialWeapon: スペシャル名
    func setup(stage: String, weapon: String, subWeapon: String, specialWeapon: String, winlose: String, indexPath: IndexPath) {
        self.stage.text = stage
        self.weapon.text = weapon
        self.subWeapon.text = subWeapon
        self.specialWeapon.text = specialWeapon
        self.winloseStatus = winlose
        self.indexPath = indexPath
        // TODO: 画像表示
    }
    
    @IBAction func winButton(_ sender: Any) {
        // TODO: 自身のindexpathと対応したRealmのwinloseプロパティを変更する
        winloseStatus = "win"
        buttonColorSwitch()
    }
    
    @IBAction func loseButton(_ sender: Any) {
        // TODO: 自身のindexpathと対応したRealmのwinloseプロパティを変更する
        winloseStatus = "lose"
        buttonColorSwitch()
    }
    
    /// 勝敗ボタンの色を切り替える
    ///
    /// - Parameter win: winボタンを押した時true, loseボタンをおしたときfalse
    func buttonColorSwitch() {
        if winloseStatus == "win" {
            winButton.backgroundColor = UIColor.red
            loseButton.backgroundColor = UIColor.gray
        } else if winloseStatus == "lose" {
            winButton.backgroundColor = UIColor.gray
            loseButton.backgroundColor = UIColor.blue
        } else {
            winButton.backgroundColor = UIColor.gray
            loseButton.backgroundColor = UIColor.gray
        }
    }
    
    /// 勝敗ボタンの色を初期化する
    func grayBothButtonColor() {
        winButton.backgroundColor = UIColor.gray
        loseButton.backgroundColor = UIColor.gray
    }
    
}


