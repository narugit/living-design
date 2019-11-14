//
//  Item.swift
//  LivingDesign
//
//  Created by naru on 2019/10/24.
//  Copyright © 2019 DSN. All rights reserved.
//

import RealmSwift

class ShareInNavigation: Object{
    @objc dynamic var data: String = ""
}

class Genre: Object, Decodable{
    @objc dynamic var name: String = ""
}

class Item: Object, Decodable{
    @objc private dynamic var id: String = NSUUID().uuidString
    @objc dynamic var name: String = ""
    private var genre = Genre()
    @objc dynamic var modelNumber: String = ""
    @objc dynamic var price: Int = 0
    @objc dynamic var purchaseDate: String = ""  // YYYY/MM/DD形式 0埋めする
    @objc dynamic var warrantyPeriod: String = "" // YYYY/MM/DD形式 0埋めする
    @objc private dynamic var disposalDate: String = "" // YYYY/MM/DD形式 0埋めする
    @objc dynamic var reason: String = ""
    @objc dynamic var confort: Int = 3
    @objc dynamic var otherTargets: String = ""
    @objc dynamic var memo: String = ""
    @objc private dynamic var isUse: Bool = true
    
    @objc override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc public func getId() -> String {
        return self.id
    }
    
    @objc public func getGenre() -> Genre {
        return self.genre
    }
    
    @objc public func setGenre(genre: Genre) -> Void {
        self.genre = genre
    }
    
    @objc public func setDisposalDate(disposalDate: String) -> Void {
        self.disposalDate = disposalDate
        
        if(self.isUse){
            self.isUse = false
        }
    }
    
    @objc public func getDisposalDate() -> String {
        return self.disposalDate
    }
    
    @objc public func getIsUse() -> Bool {
        return self.isUse
    }
}
