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
    
    private let wireframe: RootViewWireframe = RootViewWireframe()
    private let resetController: ResetController = ResetController()
    
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
    
    // 完了ボタンを押すと、削除リストを取得して、realmから削除する
    @IBAction func touchUpInsideCompleteButton(_ sender: Any) {
        let deleteCandidateItems = realm.objects(DeleteCandidateItem.self)

        for dci in deleteCandidateItems{
            try! realm.write {
                realm.delete(realm.objects(Item.self).filter("id == %@",dci.id).first!)
                realm.objects(AllItem.self).filter("id == %@",dci.id).first?.setDisposalDate(disposalDate: "2019/12/01")
            }
        }
        
        self.resetController.reset()
        
        let nextStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "HomeViewControllerID")
        self.wireframe.transition(to: nextViewController)
    }
    
    // 取り消しボタンを押すと、削除リストを削除して、削除画面に戻す（背景色を戻したい）
    @IBAction func touchUpInsideCancelButton(_ sender: Any) {
        self.resetController.reset()
        
        let nextStoryBoard = UIStoryboard(name: "Delete", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "DeleteViewControllerID")
        self.wireframe.transition(to: nextViewController)
    }
}
