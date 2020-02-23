//
//  Home.swift
//  LivingDesign
//
//  Created by naru on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Home: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    let realm = try! Realm()
    
    var currentSelected : Int?
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
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
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                               for: indexPath)
        
        if(itemInRealm != nil){
            let imageView = cell.contentView.viewWithTag(1) as! UIImageView
            let cellImage = UIImage(named: itemInRealm[indexPath.row].photo)
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            imageView.image = cellImage
            // imageViewのサイズ確認用
            // imageView.backgroundColor = .blue

            let label = cell.contentView.viewWithTag(2) as! UILabel
            label.text = itemInRealm[indexPath.row].name
            // セルのサイズ確認用
            // cell.backgroundColor = .red
        
            if self.currentSelected != nil && self.currentSelected == indexPath.row
            {
                let nextStoryBoard = UIStoryboard(name: "Detail", bundle: nil)
                let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "DetailViewControllerID")
                self.wireframe.transition(to: nextViewController, data: itemInRealm[indexPath.row].getId()) // ここにデータのidを詰める
            }
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelected = indexPath.row

        // For reload the selected cell
        collectionView.reloadItems(at: [indexPath])
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
    
    @IBAction func touchUpInsideAddButton(_ sender: Any) {
        let nextStoryBoard = UIStoryboard(name: "NewProduct", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "NewProductViewControllerID")
        self.wireframe.transition(to: nextViewController)
    }
    
    @IBAction func touchUpInsideDeleteButton(_ sender: Any) {
        let nextStoryBoard = UIStoryboard(name: "Delete", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "DeleteViewControllerID")
        self.wireframe.transition(to: nextViewController)
    }
    
}
