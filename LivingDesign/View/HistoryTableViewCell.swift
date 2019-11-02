//
//  HistoryTableViewCell.swift
//  LivingDesign
//
//  Created by naru on 2019/11/02.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit
class HistoryTabelViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    
    
    func setCell(indexPath: IndexPath, photoName: String, name: String, date: String, isUsing: Bool){
        self.nameLabel.text = name
        self.dateLabel.text = "購入日：" + date
        self.thumbnailImageView.image = UIImage(named: photoName)
        self.starImageView.isHidden = !isUsing
    }
}
