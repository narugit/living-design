//
//  Detail.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/21.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit
import Foundation
import PDFKit
import RealmSwift

class Detail: UIViewController {
    
   

    //@IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var buyreason: UILabel!
    @IBOutlet weak var assessment: UILabel!
    @IBOutlet weak var candidate: UILabel!
    @IBOutlet weak var memo: UILabel!
 
    @IBOutlet weak var productImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let shareData = realm.objects(ShareInNavigation.self)
        print(shareData)
        
        
        
        name.text = "洗濯機"
        
        
        
        productImage.image = UIImage(named: "washing-machine")
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func edit(_ sender: Any) {
    }
    
    
    @IBAction func change(_ sender: Any) {
    }
    
    
    @IBAction func discard(_ sender: Any) {
    }
    
    
}


