//
//  WaponsPerStageTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

protocol WaponsPerStageTableViewCellDelegate {
    func toWeaponSelect(indexPath: IndexPath)
}

class WaponsPerStageTableViewCell: UITableViewCell {

    /// セルID
    static let nibName = "WaponsPerStageTableViewCell"
    var winloseStatus = "both"
    var indexPath: IndexPath = [0, 0]
    var completion: () -> Void = {}
    var delegate : WaponsPerStageTableViewCellDelegate?
    
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
    ///   - entity: ステージと武器情報のエンティティ
    ///   - indexPath: 選択しているセルのindexPath
    ///   - completion: winloseボタンを押したときのクロージャ
    func setup(entity: WeaponsPerStageEntity, indexPath: IndexPath, completion: @escaping () -> Void) {
        self.stage.text = entity.stage
        self.weapon.text = entity.weapon
        self.subWeapon.text = entity.subWeapon
        self.specialWeapon.text = entity.specialWeapon
        self.winloseStatus = entity.winlose ?? "both"
        self.indexPath = indexPath
        self.completion = completion
        self.weaponImage.image = UIImage.init(named: entity.weaponIcon ?? "wakaba-shooter.png ")
        buttonColorSwitch()
    }
    
    @IBAction func winButton(_ sender: Any) {
        // TODO: 自身のindexpathと対応したRealmのwinloseプロパティを変更する
        WeaponsPerStageStoreManager.win(indexPath: indexPath)
        winloseStatus = "win"
        buttonColorSwitch()
        completion()
    }
    
    @IBAction func loseButton(_ sender: Any) {
        // TODO: 自身のindexpathと対応したRealmのwinloseプロパティを変更する
        WeaponsPerStageStoreManager.lose(indexPath: indexPath)
        winloseStatus = "lose"
        buttonColorSwitch()
        completion()
    }
    
    /// 勝敗ボタンの色を切り替える
    ///
    /// - Parameter win: winボタンを押した時true, loseボタンをおしたときfalse
    func buttonColorSwitch() {
        if winloseStatus == "win" {
            winButton.backgroundColor = ConstColor.purple
            loseButton.backgroundColor = UIColor.gray
        } else if winloseStatus == "lose" {
            winButton.backgroundColor = UIColor.gray
            loseButton.backgroundColor = ConstColor.skyBlue
        } else {
            winButton.backgroundColor = UIColor.gray
            loseButton.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func toWeaponSelect(_ sender: Any) {
        delegate?.toWeaponSelect(indexPath: indexPath)
    }
    
    /// 勝敗ボタンの色を初期化する
    func grayBothButtonColor() {
        winButton.backgroundColor = UIColor.gray
        loseButton.backgroundColor = UIColor.gray
    }
    
}


