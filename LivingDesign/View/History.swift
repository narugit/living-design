//
//  History.swift
//  LivingDesign
//
//  Created by naru on 2019/10/31.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit

class History: UIViewController, UITableViewDataSource, UITableViewDelegate{
    private let photos = ["washing-machine", "copier", "oven", "tv" ]
    private let names = ["洗濯機", "コピー機", "オーブン", "テレビ"]
    private let isUsings = [true, false, false, true]
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = self.view.frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryTabelViewCell
        
        cell.setCell(indexPath: indexPath, photoName: photos[indexPath.row], name: names[indexPath.row], date: "2019/11/1", isUsing: isUsings[indexPath.row])
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
