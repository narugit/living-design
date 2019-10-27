//
//  RealmUtility.swift
//  LivingDesign
//
//  Created by naru on 2019/10/27.
//  Copyright © 2019 DSN. All rights reserved.
//

import RealmSwift

func printRealmFilePath() -> Void{
    print(Realm.Configuration.defaultConfiguration.fileURL!)
}
