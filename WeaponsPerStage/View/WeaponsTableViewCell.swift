//
//  WeaponsTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class WeaponsTableViewCell: UITableViewCell {

    /// セルID
    static let nibName = "WeaponsTableViewCell"
    
    /// 武器名ラベル
    @IBOutlet weak var weapon: UILabel!
    /// 武器アイコン
    @IBOutlet weak var weaponIcon: UIImageView!
    /// お気に入りボタン
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// 武器名を自身のラベルにセットする
    ///
    /// - Parameter weapon: 武器名
    func setup(weapon: String) {
        self.weapon.text = weapon
        if let weaponIcon = DataSource.weaponsIconRelation[weapon] {
            self.weaponIcon.image = UIImage.init(named: weaponIcon)
        }
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        if let name = self.weapon.text {
            if WeaponsPerStageStoreManager.isSameWeapon(weapon: name) {
                // 同じ名前の武器がすでに永続化されている場合

                self.favoriteButton.alpha = 0.5
                WeaponsPerStageStoreManager.favoriteDelete(weapon: name)
            } else {
                // 同じ名前の武器が登録されていない場合

                self.favoriteButton.alpha = 1.0
                let entity = FavoriteWeaponsEntity()
                entity.weapon = name
                WeaponsPerStageStoreManager.addFavoriteWeapon(object: entity)
            }
        }
    }
    
}
