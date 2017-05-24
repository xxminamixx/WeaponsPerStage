//
//  HistoryEntity.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/05/22.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryEntity: Object {
    
    /// weaponsPerStageEntityを保持
//    dynamic var weaponsPerStageEntityList: [WeaponsPerStageEntity]?
    let weaponsPerStageEntityList = List<WeaponsPerStageEntity>()
    
    /// 自身のプロパティから勝利ステージの数を返す
    ///
    /// - Returns: 勝利数を返す
    func winCount() -> Int? {
//        guard weaponsPerStageEntityList = weaponsPerStageEntityList else {
//            return nil
//        }
        return weaponsPerStageEntityList.filter({$0.winlose == "win"}).count
    }
    
    /// 自身のプロパティから敗北ステージの数を返す
    ///
    /// - Returns: 敗北数
    func loseCount() -> Int? {
//        guard let weaponsPerStageEntityList = weaponsPerStageEntityList else {
//            return nil
//        }
        return weaponsPerStageEntityList.filter({$0.winlose == "lose"}).count
    }
    
}
