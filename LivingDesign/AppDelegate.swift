//
//  AppDelegate.swift
//  LivingDesign
//
//  Created by naru on 2019/10/14.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let resetController: ResetController = ResetController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let config = Realm.Configuration(
            // データ構造変更するたびに更新する必要あり。前よりも大きな値にする
            schemaVersion: 14,
            
            //スキーマのバージョンが上記のものよりも低いものを開こうとした場合、自動的に呼び出されるブロックを設定する
            migrationBlock: { migration, oldSchemaVersion in
                //まだ何も移行していないので、oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Realmは新しいプロパティと削除されたプロパティを自動的に検出します
                    //そして自動的にディスク上のスキーマを更新する
                }
            }
        )

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config

        // デフォルトのレルムに対してこの新しい設定オブジェクトを使用するようにRealmに指示します
        let realm = try! Realm()
        printRealmFilePath()
        print(realm, "Realm")
        print(config,"Realm Version")

        // リリース時には削除する
        // Data/test.*Data.jsonを読み込んで、Realmに書き込む
        // jsonのデータにリセットしたい場合に使用
        // そうでない場合は、下の行をコメントする
        loadTestData()
        
        // DeleteCandidateが存在するなら、削除しちゃう
        self.resetController.reset()
        
        return true
    }
    
    func getFileData(_ filePath: String) -> Data? {
      let fileData: Data?
      do {
        let fileUrl = URL(fileURLWithPath: filePath)
        fileData = try Data(contentsOf: fileUrl)
      } catch {
        // ファイルデータの取得でエラーの場合
        fileData = nil
      }
      return fileData
    }
    
    func loadTestData(){
        let realm = try! Realm()
        
        do {
            let genreInRealm = realm.objects(Genre.self).first
            let path = Bundle.main.path(forResource: "testGenreData", ofType:"json")
            let data = getFileData(path!)
            let testGenreData = try! JSONDecoder().decode(Genre.self, from: data!) as! Genre

            if(genreInRealm != nil){
                try! realm.write {
                    realm.delete(genreInRealm!)
                }
                print("genreを削除")
            } else{
                print("genreは空")
            }
                
            let genre = Genre()
            genre.name = testGenreData.name
            try! realm.write{
                realm.add(genre)
            }
            print("genreを追加")
        }
        
        do {
            let itemInRealm = realm.objects(Item.self)
            let allItemInRealm = realm.objects(AllItem.self)
            let path = Bundle.main.path(forResource: "testItemData", ofType:"json")
            let data = getFileData(path!)
            let testItemData = try! JSONDecoder().decode([Item].self, from: data!) as! [Item]
            
            if(itemInRealm != nil){
                for iir in itemInRealm{
                    try! realm.write {
                        realm.delete(iir)
                    }
                }
                print("itemを削除")
            } else{
                print("itemは空")
            }
            
            if(allItemInRealm != nil){
                for aiir in allItemInRealm{
                    try! realm.write {
                        realm.delete(aiir)
                    }
                }
                print("allItemを削除")
            } else{
                print("allItemは空")
            }
                
            for tid in testItemData{
                let item = Item()
                let allItem = AllItem()
                allItem.setId(id: item.getId())
                (allItem.name, item.name) = (tid.name, tid.name)
                (allItem.genre, item.genre) = (tid.genre, tid.genre)
                (allItem.modelNumber, item.modelNumber) = (tid.modelNumber, tid.modelNumber)
                (allItem.price, item.price) = (tid.price, tid.price)
                (allItem.purchaseDate, item.purchaseDate) = (tid.purchaseDate, tid.purchaseDate)
                (allItem.warrantyPeriod, item.warrantyPeriod) = (tid.warrantyPeriod, tid.warrantyPeriod)
                (allItem.reason, item.reason) = (tid.reason, tid.reason)
                (allItem.confort, item.confort) = (tid.confort, tid.confort)
                (allItem.otherTargets, item.otherTargets) = (tid.otherTargets, tid.otherTargets)
                (allItem.memo, item.memo) = (tid.memo, tid.memo)
                (allItem.photo, item.photo) = (tid.photo, tid.photo)
                
                try! realm.write{
                    realm.add(item)
                    realm.add(allItem)
                }
            }
            print("itemを追加")
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

