//
//  History.swift
//  LivingDesign
//
//  Created by naru on 2019/10/31.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class History: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = self.view.frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.realm.objects(AllItem.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemInRealm = self.realm.objects(AllItem.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryTabelViewCell
        
        var genre = itemInRealm[indexPath.row].genre
        
        if(indexPath.row > 0){
            genre = itemInRealm[indexPath.row].genre == itemInRealm[indexPath.row-1].genre ? "" : genre
        }
        // 以下、inUse書き込めているかテスト
        // 値の書き換えはrealm.write内でやらないと例外走るようになっている
        // try! realm.write {
        // itemInRealm[indexPath.row].setDisposalDate(disposalDate: "hoge")
        // }
        cell.setCell(indexPath: indexPath, photoName: itemInRealm[indexPath.row].photo, name: itemInRealm[indexPath.row].name, date: itemInRealm[indexPath.row].purchaseDate, isUsing: itemInRealm[indexPath.row].getIsUse(), genre: genre)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // タップされたセルの行番号を出力
        let itemInRealm = self.realm.objects(AllItem.self)
        let nextStoryBoard = UIStoryboard(name: "Detail", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "DetailViewControllerID")
        self.wireframe.transition(to: nextViewController, data: itemInRealm[indexPath.row].getId())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
