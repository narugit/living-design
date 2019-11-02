//
//  Delete.swift
//  LivingDesign
//
//  Created by naru on 2019/10/30.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit

class Delete: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    private let photos = ["washing-machine", "copier", "oven", "tv" ]
    private let names = ["洗濯機", "コピー機", "オーブン", "テレビ"]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "家電"
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width / 4, height: (self.view.frame.width / 4 + 50))
        self.collectionView.collectionViewLayout = layout
    }
    
    // 画面生成後の処理
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell: UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "DeleteCell",
                                               for: indexPath)

        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = UIImage(named: photos[indexPath.row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = cellImage
        // imageViewのサイズ確認用
        // imageView.backgroundColor = .blue

        let label = cell.contentView.viewWithTag(2) as! UILabel
        label.text = names[indexPath.row]
        // セルのサイズ確認用
        // cell.backgroundColor = .red
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // 要素数を格納
        return self.photos.count;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
