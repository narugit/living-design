//
//  ResetController.swift
//  LivingDesign
//
//  Created by naru on 2019/11/30.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import RealmSwift

class ResetController{
    private func resetDeleteCandidate(){
        let realm = try! Realm()
        let deleteCandidateItemInRealm = realm.objects(DeleteCandidateItem.self)
        
        if(deleteCandidateItemInRealm.first != nil){
            for dci in deleteCandidateItemInRealm{
                try! realm.write {
                    realm.delete(dci)
                }
            }
            print("deleteCandidateItemを削除")
        } else{
            print("deleteCandidateItemは空")
        }
    }
    
    public func reset(){
        self.resetDeleteCandidate()
    }
}
