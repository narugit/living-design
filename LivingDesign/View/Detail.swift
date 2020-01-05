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
    @IBOutlet weak var memo: UILabel!
    
    var thisItem: Item = Item()
    var currentSelected: Int?
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let shareData = realm.objects(ShareInNavigation.self).first
        print(shareData!.data)
        let inputId:String = shareData!.data
        thisItem = realm.objects(Item.self).filter("id == %@",inputId).first!
        print(thisItem)
        self.name.text = self.thisItem.name
        self.genre.text = self.thisItem.genre
        self.modelNumber.text = self.thisItem.modelNumber
        self.price.text = String(self.thisItem.price)
        self.purchaseDate.text = self.thisItem.purchaseDate
        self.reason.text = self.thisItem.reason
        self.comfort.text = String(self.thisItem.confort)
        self.warrantyPeriod.text = self.thisItem.warrantyPeriod
        self.otherTargets.text = self.thisItem.otherTargets
        self.photo.image = UIImage(named:self.thisItem.photo)
        self.memo.text = self.thisItem.memo
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func TouchUpInsideDepositButton(_ sender: Any) {
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


