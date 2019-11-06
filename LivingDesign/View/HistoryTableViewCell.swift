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
    @IBOutlet weak var genreLabel: UILabel!
    
    func setCell(indexPath: IndexPath, photoName: String, name: String, date: String, isUsing: Bool, genre: String){
        self.nameLabel.text = name
        self.dateLabel.text = "購入日：" + date
        self.thumbnailImageView.image = UIImage(named: photoName)
        self.starImageView.isHidden = !isUsing
        if(genre == ""){
            self.genreLabel.isHidden = true
        }else{
            self.genreLabel.text = genre
        }
        
    }
}
