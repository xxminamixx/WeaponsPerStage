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
    
    func setup(history: HistoryEntity) {
        
        // 勝敗をセット
        if let winCount = history.winCount() {
            self.winCount.text = String(winCount)
        } else {
            // TODO: nilだった場合に何をセットするか検討
            self.winCount.text = "0"
        }
        
        if let loseCount = history.loseCount() {
            self.loseCount.text = String(loseCount)
        } else {
            self.loseCount.text = "0"
        }
        
        if history.winCount()! > history.loseCount()! {
            result.text = "win"
        } else {
            result.text = "lose"
        }
        
        // 日付をセット
        date.text = history.date

        /// 勝敗ラベルの背景色を変更
        result.textColor = UIColor.white
        if result.text == "win" {
            // 勝敗ラベルがwinだった場合、ラベル背景を紫に変更
            result.backgroundColor = ConstColor.purple
        } else {
            // 勝敗ラベルがloseだった場合、ラベル背景を青に変更
            result.backgroundColor = ConstColor.skyBlue
        }
        
        // 勝敗カウントの文字色を変更
        winCount.textColor = ConstColor.purple
        loseCount.textColor = ConstColor.skyBlue
    }
    
}
