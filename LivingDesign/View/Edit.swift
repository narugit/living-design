//
//  Edit.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Edit: UIViewController {
    
   
    //@IBOutlet weak var productImage: UIImageView!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var buyDate: UITextField!
    @IBOutlet weak var buyReason: UITextField!
    
    @IBOutlet weak var warrantyPeriod: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    var currentSelected : Int?
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "洗濯機"
        }
        
    @IBAction func TouchUpInsideReturnButton(_ sender: Any) {
    }
    

    @IBAction func TouchUpInsideRegisterButton(_ sender: Any) {
    }
    
    
    
}



