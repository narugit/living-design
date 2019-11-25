//
//  DeleteCollectionViewCell.swift
//  LivingDesign
//
//  Created by naru on 2019/10/31.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
 
class DeleteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabelWithID!
    
    // ボタン内で指を離した際の処理
    @IBAction func touchUpInside(_ sender: Any) {
        deleteButton.backgroundColor = UIColor.init(red: 193/255, green: 24/255, blue: 84/255, alpha: 100/100)
    }
    
    // ボタン外で指を離した際の処理
    @IBAction func touchUpOutside(_ sender: Any) {
        deleteButton.backgroundColor = UIColor.init(red: 193/255, green: 24/255, blue: 84/255, alpha: 100/100)
    }
    
    // ボタンを押下した際の処理
    @IBAction func touchDown(_ sender: Any) {
        deleteButton.backgroundColor = UIColor.init(red: 255/255, green: 208/255, blue: 226/255, alpha: 100/100)
    }
    

}
