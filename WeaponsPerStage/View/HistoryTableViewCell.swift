//
//  HistoryTableViewCell.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/05/24.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var loseCount: UILabel!
    @IBOutlet weak var date: UILabel!
    
    static let nibName = "HistoryTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
