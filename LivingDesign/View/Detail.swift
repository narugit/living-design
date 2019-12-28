//
//  Detail.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/21.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Detail: UIViewController {
    
   

    //@IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var modelNumber: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var purchaseDate: UILabel!
    @IBOutlet weak var warrantyPeriod: UILabel!
    @IBOutlet weak var reason: UILabel!
    @IBOutlet weak var comfort: UILabel!
    @IBOutlet weak var otherTargets: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    let realm = try! Realm()
    var id: String?
    
    var currentSelected : Int?
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let shareData = realm.objects(ShareInNavigation.self).first
        print(shareData!.data)
        let inputId:String = shareData!.data
        self.id = inputId
        let thisItem = realm.objects(Item.self).filter("id == %@",inputId).first
        print(thisItem)
        self.name.text = thisItem!.name
        self.genre.text = thisItem!.genre
        self.modelNumber.text = thisItem!.modelNumber
        //self.price.text = thisItem!.price
        self.purchaseDate.text = thisItem!.purchaseDate
        self.reason.text = thisItem!.reason
        //self.comfort.text = thisItem!
        self.warrantyPeriod.text = thisItem!.warrantyPeriod
        self.otherTargets.text = thisItem!.otherTargets
        //self.photo.image = thisItem!.photo
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func TouchUpInsideDepositButton(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "家電を廃棄", message: "この家電を本当に廃棄しますか？", preferredStyle:  UIAlertController.Style.actionSheet)
        
        let depositAction: UIAlertAction = UIAlertAction(title: "廃棄", style: UIAlertAction.Style.destructive, handler:{
            (action: UIAlertAction!) -> Void in
            // Itemから削除
            // AllItemのisUseをfalseにする
            // Home画面に遷移
            let today = DateFormatter()
            today.dateFormat = "yyyy/MM/dd"
            let now = Date()
            
            try! self.realm.write {
                self.realm.delete(self.realm.objects(Item.self).filter("id == %@",self.id).first!)
                self.realm.objects(AllItem.self).filter("id == %@",self.id).first?.setDisposalDate(disposalDate: today.string(from: now))
            }
            
            
            
            let nextStoryBoard = UIStoryboard(name: "Home", bundle: nil)
            let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "HomeViewControllerID")
            self.wireframe.transition(to: nextViewController)
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(depositAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func TouchUpInsideEditButton(_ sender: Any) {
        let nextStoryBoard = UIStoryboard(name: "Edit", bundle: nil)
            let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "EditViewControllerID")
            self.wireframe.transition(to: nextViewController)
    }
    
    @IBAction func TouchUpInsideChangeButton(_ sender: Any) {
        let nextStoryBoard = UIStoryboard(name: "NewProduct", bundle: nil)
            let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "NewProductViewControllerID")
            self.wireframe.transition(to: nextViewController)
    }


}


