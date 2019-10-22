//
//  Edit.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit
import Foundation
import PDFKit

class Edit: UIViewController {
    
   
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
    @IBOutlet weak var productImage: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "洗濯機"
        
        
        if let pdfURL = Bundle.main.url(forResource: "washing-machine", withExtension: "pdf") {
            if let pdf = PDFDocument(url: pdfURL) {
                productImage.document = pdf
                // PDFの拡大率を調整する
                productImage.autoScales = true
                // 表示モード
                productImage.displayMode = .singlePageContinuous
            }
        }
        
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



