//
//  JsonManager.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/02.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

class JsonManager {
    
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
    
    static func weaponsName() -> Array<String> {
        guard let weaponsList = weaponsList() else {
            return []
        }
        
        // Stirngの空配列を定義
        var weaponsNameList = [String]()
        /*
            name: ""
            sub: ""
            special: ""
         
         というjsonからnameだけ取り出し配列化する
         */
        for weapon in weaponsList {
            if let name = weapon["name"] {
                weaponsNameList.append(name)
            }
        }
        return weaponsNameList
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
