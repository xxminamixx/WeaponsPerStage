//
//  WeaponsPerStageStoreManager.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/03.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import RealmSwift

class WeaponsPerStageStoreManager: NSObject {
    
    /// エンティティを永続化
    ///
    /// - Parameter object:
    static func add(object: WeaponsPerStageEntity) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object)
        }
    }
    
    /// 永続化されているWeaponsPerStageEntityを返す
    ///
    /// - Returns: WeaponsPerStageEntity
    static func weaponsPerStageList() -> Results<WeaponsPerStageEntity> {
        let realm = try! Realm()
        return realm.objects(WeaponsPerStageEntity.self)
    }
    
    static func winloseInit() {
        let realm = try! Realm()
        try! realm.write {
            weaponsPerStageList().setValue("both", forKey: "winlose")
        }
    }
    
    // 指定したindexにあるプロパティをwinに更新
    static func win(indexPath: IndexPath) {
        let array = weaponsPerStageList()
        save {
            array[indexPath.row].winlose = "win"
        }
    }
    
    // 指定したindexにあるプロパティをloseに更新
    static func lose(indexPath: IndexPath) {
        let array = weaponsPerStageList()
        save {
            array[indexPath.row].winlose = "lose"
        }
    }

    static func winCount() -> Int {
        let array = weaponsPerStageList()
        return array.filter({ $0.winlose == "win" }).count
    }
    
    static func loseCount() -> Int {
        let array = weaponsPerStageList()
        return array.filter({ $0.winlose == "lose" }).count
    }

    
    /// 全データ削除
    static func DeleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    /// クロージャに更新処理を渡す
    ///
    /// - Parameter closure: 更新処理
    static func save(closure: () -> Void) {
        let realm = try! Realm()
        try! realm.write {
            closure()
        }
    }
}
