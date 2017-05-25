//
//  WeaponsPerStageStoreManager.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/03.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import RealmSwift

class WeaponsPerStageStoreManager: NSObject {
    
    // MARK: WeaponsPerStageEntity
    
    /// エンティティを永続化
    ///
    /// - Parameter object:
    static func addWeaponsPerStage(object: WeaponsPerStageEntity) {
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
    
    // MARK: HistoryEntity
    
    /// WeaponsPerStageEntityを取得しHistoryEntityに格納し永続化
    static func addHistory() {
        
        let entity = HistoryEntity()
        
        // 永続化されているweaponsPerStageの中でリレーションプロパティがfalseのものを取得
        for weaponsPerStage in weaponsPerStageList().filter({!($0.isRelationToHistory.value!)}) {
            let copyInstance = weaponsPerStage.copy() as! WeaponsPerStageEntity
            // リレーションフラグをtrueにしHistoryに格納
            copyInstance.isRelationToHistory.value = true
            entity.weaponsPerStageEntityList.append(copyInstance)
        }
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(entity)
        }
    }
    
    
    /// 永続化されているHistoryEntityを返す
    ///
    /// - Returns: HistoryEntity
    static func historyList() -> Results<HistoryEntity> {
        let realm = try! Realm()
        return realm.objects(HistoryEntity.self)
    }
    
    /// 永続化HistoryEntityの長さを返す
    static func historyCount() -> Int {
        return WeaponsPerStageStoreManager.historyList().count
    }
    
    // MARK: winlose
    
    static func winloseInit() {
        let realm = try! Realm()
        try! realm.write {
            weaponsPerStageList().setValue("both", forKey: "winlose")
        }
    }
    
    // 指定したindexにあるwinloseプロパティを取得
    static func winloseValue(indexPath: IndexPath) -> String? {
        let array = weaponsPerStageList()
        return array[indexPath.row].winlose
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
    
    // 指定したindexにあるプロパティをbothに更新
    static func both(indexPath: IndexPath) {
        let array = weaponsPerStageList()
        save {
            array[indexPath.row].winlose = "both"
        }
    }

    static func winCount() -> Int {
        let array = weaponsPerStageList()
        return array.filter({!( $0.isRelationToHistory.value! )}).filter({ $0.winlose == "win" }).count
    }
    
    static func loseCount() -> Int {
        let array = weaponsPerStageList()
        return array.filter({!( $0.isRelationToHistory.value! )}).filter({ $0.winlose == "lose" }).count
    }

    // お気に入りも消える可能性あり
    /// 全データ削除
    static func DeleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    // MARK:  FavoriteWeaponsEntity
    
    /// エンティティを永続化
    ///
    /// - Parameter object:
    static func addFavoriteWeapon(object: FavoriteWeaponsEntity) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object)
        }
    }
    
    /// お気に入り武器のリストを返す
    ///
    /// - Returns: FavoriteWeaponsEntity
    static func favoriteWeaponsList() -> Results<FavoriteWeaponsEntity> {
        let realm = try! Realm()
        return realm.objects(FavoriteWeaponsEntity.self)
    }
    
    
    /// お気に入り武器の個数を返す
    ///
    /// - Returns: お気に入り武器個数
    static func favoriteWeaponsCount() -> Int {
        return favoriteWeaponsList().count
    }
    
    /// お気に入りの有無を返す
    ///
    /// - Returns: 
    ///   - true : お気に入り登録武器あり
    ///   - false: お気に入り登録武器なし
    static func isFavoriteWeapon() -> Bool {
        return  favoriteWeaponsList().count > 0
    }
    
    /// 同じ武器名が永続されていないかチェック
    ///
    /// - Parameter weapon: 武器名
    /// - Returns: 
    ///   - true : 同じ武器がある
    ///   - false: 同じ武器がない
    static func isSameWeapon(weapon: String) -> Bool {
        return favoriteWeaponsList().filter("weapon == %@", weapon).count > 0
    }
    
    
    /// 同じ武器名を削除
    ///
    /// - Parameter weapon: 武器名
    static func favoriteDelete(weapon: String) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(favoriteWeaponsList().filter("weapon == %@", weapon))
        }
    }
    
    // MARK: Utility
    
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
