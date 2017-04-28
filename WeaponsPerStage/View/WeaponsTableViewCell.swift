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
    func setup(weapon: String, indexPath: IndexPath) {
        self.weapon.text = weapon
        if let weaponIcon = DataSource.weaponsIconRelation[weapon] {
            self.weaponIcon.image = UIImage.init(named: weaponIcon)
        }
        
        // お気に入りされている武器はお気に入りボタンの色を変える
//        if WeaponsPerStageStoreManager.isSameWeapon(weapon: weapon) {
//            favoriteButton.setTitleColor(ConstColor.purple, for: .normal)
//        } else {
//            favoriteButton.setTitleColor(UIColor.gray, for: .normal)
//        }
        
        storedHandler(weapon: weapon,
                      exist: { favoriteButton.setTitleColor(ConstColor.purple, for: .normal) },
                      notEexist: { favoriteButton.setTitleColor(UIColor.gray, for: .normal) })
        
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
//        if let name = weapon.text {
//            if WeaponsPerStageStoreManager.isSameWeapon(weapon: name) {
//                // 同じ名前の武器がすでに永続化されている場合
//
//                favoriteButton.setTitleColor(UIColor.gray, for: .normal)
//                WeaponsPerStageStoreManager.favoriteDelete(weapon: name)
//            } else {
//                // 同じ名前の武器が登録されていない場合
//
//                favoriteButton.setTitleColor(ConstColor.purple, for: .normal)
//                let entity = FavoriteWeaponsEntity()
//                entity.weapon = name
//                WeaponsPerStageStoreManager.addFavoriteWeapon(object: entity)
//            }
//        }
        if let weapon = weapon.text {
            storedHandler(weapon: weapon,
                          exist: {
                            favoriteButton.setTitleColor(UIColor.gray, for: .normal)
                            WeaponsPerStageStoreManager.favoriteDelete(weapon: weapon)
            },
                          notEexist: {
                            favoriteButton.setTitleColor(ConstColor.purple, for: .normal)
                            let entity = FavoriteWeaponsEntity()
                            entity.weapon = weapon
                            WeaponsPerStageStoreManager.addFavoriteWeapon(object: entity)
            })
        }
    }
    
    private func storedHandler(weapon: String, exist: () -> Void, notEexist: () -> Void ) {
        if WeaponsPerStageStoreManager.isSameWeapon(weapon: weapon) {
            // 同じ名前の武器がすでに永続化されている場合
            exist()
        } else {
            // 同じ名前の武器が登録されていない場合
            notEexist()
        }
    }
    
}
