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
    
    ///武器名ラベル
    @IBOutlet weak var weapon: UILabel!
    
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
    }
    
}
