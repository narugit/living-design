//
//  Delete.swift
//  LivingDesign
//
//  Created by naru on 2019/10/30.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Delete: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let realm = try! Realm()
    
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
        let itemInRealm = self.realm.objects(Item.self)
        
        let cell: UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "DeleteCell",
                                               for: indexPath)

        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = UIImage(named: itemInRealm[indexPath.row].photo)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = cellImage
        // imageViewのサイズ確認用
        // imageView.backgroundColor = .blue

        let label = cell.contentView.viewWithTag(2) as! UILabelWithID
        label.text = itemInRealm[indexPath.row].name
        label.id = itemInRealm[indexPath.row].getId()
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
        return self.realm.objects(Item.self).count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
