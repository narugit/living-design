//
//  Detail.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/21.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit
import Foundation

class Detail: UIViewController {
    
   
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var buyreason: UILabel!
    @IBOutlet weak var assessment: UILabel!
    @IBOutlet weak var candidate: UILabel!
    @IBOutlet weak var memo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "洗濯機"
        
        
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


