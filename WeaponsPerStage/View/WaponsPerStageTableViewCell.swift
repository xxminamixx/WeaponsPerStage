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
    
    override func awakeFromNib() {
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
    func setup(stage: String, weapon: String, subWeapon: String, specialWeapon: String) {
        self.stage.text = stage
        self.weapon.text = weapon
        self.subWeapon.text = subWeapon
        self.specialWeapon.text = specialWeapon
        // TODO: 画像表示
    }
}


