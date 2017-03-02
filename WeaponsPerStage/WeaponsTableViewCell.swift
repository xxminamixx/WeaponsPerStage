//
//  WeaponsTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class WeaponsTableViewCell: UITableViewCell {

    @IBOutlet weak var weapon: UILabel!
    static let nibName = "WeaponsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(weapon: String) {
        self.weapon.text = weapon
    }
    
}
