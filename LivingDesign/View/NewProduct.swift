//
//  NewProduct.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class NewProduct: UIViewController {
    
   
    //@IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var buyreason: UILabel!
    @IBOutlet weak var assessment: UILabel!
    @IBOutlet weak var candidate: UILabel!
    @IBOutlet weak var memo: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var currentSelected : Int?
    private let wireframe: RootViewWireframe = RootViewWireframe()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func TouchUpInsideReturnButton(_ sender: Any) {
    }
    
    @IBAction func TouchUpInsideRegisterButton(_ sender: Any) {
    }
    
    

}
