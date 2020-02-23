//
//  Item.swift
//  LivingDesign
//
//  Created by naru on 2019/10/24.
//  Copyright © 2019 DSN. All rights reserved.
//

import RealmSwift

class DeleteCandidateItem: Object{
    @objc dynamic var id: String = ""
}

class ShareInNavigation: Object{
    @objc dynamic var data: String = ""
}

class Genre: Object, Decodable{
    @objc dynamic var name: String = ""
}

class SmallGenre: Object, Decodable{
    @objc dynamic var name: String = ""
    @objc dynamic var photoName: String = ""
}

class Item: Object, Decodable{
    @objc private dynamic var id: String = NSUUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var genre: String = ""
    @objc dynamic var modelNumber: String = ""
    @objc dynamic var price: Int = -1
    @objc dynamic var purchaseDate: String = ""  // YYYY/MM/DD形式 0埋めする
    @objc dynamic var warrantyPeriod: String = "" // YYYY/MM/DD形式 0埋めする
    @objc dynamic var reason: String = ""
    @objc dynamic var confort: Int = -1
    @objc dynamic var otherTargets: String = ""
    @objc dynamic var memo: String = ""
    @objc dynamic var photo: String = ""
    
    @objc override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc public func getId() -> String {
        return self.id
    }
}

class AllItem: Object, Decodable{
    @objc private dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var genre: String = ""
    @objc dynamic var modelNumber: String = ""
    @objc dynamic var price: Int = -1
    @objc dynamic var purchaseDate: String = ""  // YYYY/MM/DD形式 0埋めする
    @objc dynamic var warrantyPeriod: String = "" // YYYY/MM/DD形式 0埋めする
    @objc private dynamic var disposalDate: String = "" // YYYY/MM/DD形式 0埋めする
    @objc dynamic var reason: String = ""
    @objc dynamic var confort: Int = -1
    @objc dynamic var otherTargets: String = ""
    @objc dynamic var memo: String = ""
    @objc private dynamic var isUse: Bool = true
    @objc dynamic var photo: String = ""
    
    @objc override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc public func setId(id: String) -> Void {
        self.id = id
    }
    
    @objc public func getId() -> String {
        return self.id
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
