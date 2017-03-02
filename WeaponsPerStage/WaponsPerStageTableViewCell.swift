//
//  WaponsPerStageTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class WaponsPerStageTableViewCell: UITableViewCell {

    static let nibName = "WaponsPerStageTableViewCell"
    
    @IBOutlet weak var stage: UILabel!
    @IBOutlet weak var weapon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(stage: String, weapon: String) {
        self.stage.text = stage
        self.weapon.text = weapon
    }
}


