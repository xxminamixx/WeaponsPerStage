//
//  WeaponsPerStageEntity.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/03.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit
import RealmSwift

class WeaponsPerStageEntity: Object, NSCopying {
    dynamic var stage: String?
    dynamic var weapon: String?
    dynamic var weaponIcon: String?
    dynamic var subWeapon: String?
    dynamic var specialWeapon: String?
    dynamic var winlose: String?
    
    convenience init(stage: String, weapon: String, weaponIcon: String, subWeapon: String, specialWeapon: String, winlose: String) {
        self.init()
        self.stage = stage
        self.weapon = weapon
        self.weaponIcon = weaponIcon
        self.subWeapon = subWeapon
        self.specialWeapon = specialWeapon
        self.winlose = winlose
    }
    
    func copy(with zone: NSZone?) -> Any {
        let instance = WeaponsPerStageEntity.init(stage: stage!, weapon: weapon!, weaponIcon: weaponIcon!, subWeapon: subWeapon!, specialWeapon: specialWeapon!, winlose: winlose!)
        return instance
    }
}
