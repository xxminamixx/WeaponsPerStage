//
//  JsonManager.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class JsonManager {
    
    static func initUserData() {
        // ステージ配列の分だけ回し永続化する
        /* TODO: 
            ステージ配列の長さとその他DataSourceの配列の長さが同じ前提で作っているが、
            配列の長さが異なる時クラッシュするため対応方法検討する必要あり
        */
        for (index, element) in DataSource.stageList.enumerated() {
           let entity = WeaponsPerStageEntity()
            entity.stage = element
            entity.weapon = DataSource.weaponsList[index]
            entity.subWeapon = DataSource.subWeaponsList[index]
            entity.specialWeapon = DataSource.specialWeaponsList[index]
            WeaponsPerStageStoreManager.add(object: entity)
        }
    }
    
    static func weaponsList() -> Array<Dictionary<String, String>>? {
        let json = try! JSONSerialization.jsonObject(with: getResourceJson(name: "weapons")!,
                                                     options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        
        guard let weapons = json.value(forKey: "weapons") as! Array<Dictionary<String, String>>? else {
            return nil
        }
        
        // 武器配列を返す
        return weapons
    }
    
    // 武器個数を返す、パースに失敗している場合は0を返す
    static func CountAllWeapons() -> Int {
        guard let weaponsList = weaponsList() else {
            return 0
        }
        return weaponsList.count
    }
    
    /// 武器マスタから武器名だけの配列を作成し返す
    ///
    /// - Returns: 武器名配列
    static func weaponsName() -> Array<String> {
        return weaponsElementList(key: "name")
    }
    
    /// 武器マスタからサブ名だけの配列を作成し返す
    ///
    /// - Returns: サブ名配列
    static func subWeaponsNameList() -> Array<String> {
        return weaponsElementList(key: "sub")
    }
    
    /// 武器マスタからスペシャル名だけの配列を作成し返す
    ///
    /// - Returns: スペシャル名配列
    static func specialWeaponsList() -> Array<String> {
        return weaponsElementList(key: "special")
    }
    
    /// 武器マスタからkeyに応じたkey配列を返す
    ///
    /// - Parameter key: 武器辞書から欲しいkey
    /// - Returns: key配列 ex: 引数nameとするとname配列を返す
    static func weaponsElementList(key: String) -> Array<String> {
        guard let weaponsList = JsonManager.weaponsList() else {
            return []
        }
        
        var keyNameList = [String]()
        for weapon in weaponsList {
            if let value = weapon[key] {
                keyNameList.append(value)
            }
        }
        return keyNameList
    }
    
    /// jsonデータをData型で返す
    ///
    /// - Parameter name: ファイル名
    /// - Returns: jsonをDataにしたもの
    static func getResourceJson(name:String) -> Data? {
        let bundlePath : String = Bundle.main.path(forResource: "Resources", ofType: "bundle")!
        let bundle = Bundle(path: bundlePath)!
        if let jsonPath : String = bundle.path(forResource: name, ofType: "json") {
            let fileHandle : FileHandle = FileHandle(forReadingAtPath: jsonPath)!
            let jsonData : Data = fileHandle.readDataToEndOfFile()
            return jsonData
        }
        return nil
    }
}
