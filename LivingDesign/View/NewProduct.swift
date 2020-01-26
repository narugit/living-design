//
//  NewProduct.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift



class NewProduct: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var modelNumber: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var purchaseDate: UITextField!
    @IBOutlet weak var warrantyPeriod: UITextField!
    @IBOutlet weak var reason: UITextField!
    @IBOutlet weak var comfort: UITextField!
    @IBOutlet weak var other: UITextField!
    @IBOutlet weak var memo: UITextField!
    
    
    var newItem: Item = Item()
    var newAllItem: AllItem = AllItem()
    var currentSelected: Int?
    let realm = try! Realm()
    var id: String?
    
    private let wireframe: RootViewWireframe = RootViewWireframe()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func TouchUpInsideReturnButton(_ sender: Any) {
    }
    
    @IBAction func TouchUpInsideRegisterButton(_ sender: Any) {
      
        let realm = try! Realm()
        print(newItem)
        
        
        self.newItem.name =
            self.name.text!
        //self.genre.text = self.thisItem.genre
        self.newItem.modelNumber = self.modelNumber.text!
        self.newItem.price = Int(self.price.text!) ?? self.newItem.price
        self.newItem.purchaseDate = self.purchaseDate.text!
        self.newItem.reason = self.reason.text!
        self.newItem.confort = Int(self.comfort.text!) ?? self.newItem.confort
        //Int(self.comfort.text!)!
        self.newItem.warrantyPeriod = self.warrantyPeriod.text!
        self.newItem.otherTargets = self.other.text!
        //self.photo.image = UIImage(named:self.thisItem.photo)
        self.newItem.memo = self.memo.text!
        
        //allitemへの登録
        
        self.newAllItem.name =
            self.newItem.name
        //self.genre.text = self.thisItem.genre
        self.newAllItem.modelNumber =
        self.newItem.modelNumber
        self.newAllItem.price =
        self.newItem.price
        self.newAllItem.purchaseDate =
        self.newItem.purchaseDate
        self.newAllItem.reason =
        self.newItem.reason
        self.newAllItem.confort = self.newItem.confort
        self.newAllItem.warrantyPeriod =
        self.newItem.warrantyPeriod
        self.newAllItem.otherTargets = self.newItem.otherTargets
        //self.photo.image = UIImage(named:self.thisItem.photo)
        self.newAllItem.memo =
        self.newItem.memo
            
        try! realm.write(){
            realm.add(self.newItem)
            realm.add(self.newAllItem)
        }
    
        //Homeに移動
        let nextStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "HomeViewControllerID")
        self.wireframe.transition(to: nextViewController)

        
    }
    
    

}
