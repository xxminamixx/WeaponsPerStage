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
    dynamic var weaponsPerStageEntityList: [WeaponsPerStageEntity]?
}
