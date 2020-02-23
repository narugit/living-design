//
//  changeItem.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2020/01/26.
//  Copyright © 2020 DSN. All rights reserved.
//
import Foundation
import UIKit
import RealmSwift
import PickerButton

class ChangeItem: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var modelNumber: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var purchaseDate: UITextField!
    @IBOutlet weak var warrantyPeriod: UITextField!
    @IBOutlet weak var reason: UITextField!
    @IBOutlet weak var comfort: UITextField!
    @IBOutlet weak var other: UITextField!
    @IBOutlet weak var memo: UITextField!
    @IBOutlet weak var photo: UIImageView!
    //@IBOutlet weak var genre: PickerButton!
    
    var changedItem: Item = Item()
    var changedAllItem: AllItem = AllItem()
    var currentSelected : Int?
    private let wireframe: RootViewWireframe = RootViewWireframe()


override func viewDidLoad() {
    super.viewDidLoad()
    let realm = try! Realm()
       let shareData = realm.objects(ShareInNavigation.self).first
       print(shareData!.data)
       let inputId:String = shareData!.data
     changedItem = realm.objects(Item.self).filter("id == %@",inputId).first!
    print(changedItem)
    self.name.text = self.changedItem.name
        //self.genre.layer.borderColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0).cgColor
        //self.genre.layer.cornerRadius = 5.0;
        //self.genre.layer.borderWidth = 1.0
        
        //self.genre.delegate = self
        //self.genre.dataSource = self
        //self.genre.text = self.thisItem.genre
    //self.price.text = self.changedItem.price < 0 ? "" :String(self.changedItem.price)
    //self.comfort.text = self.changedItem.confort < 0 ? "" :String(self.changedItem.confort)
        

    self.photo.image = UIImage(named:self.changedItem.photo)
       //self.memo.text = self.thisItem.memo
      //let today = DateFormatter()
      //today.dateFormat = "yyyy/MM/dd"
      //let now = Date()
        //self.purchaseDate.text = now.text*/
    
       }
    
    
    
    @IBAction func TouchUpInsideResister(_ sender: Any) {
        let realm = try! Realm()
            print(changedItem)
            
            
            self.changedItem.name =
                self.name.text!
            //self.genre.text = self.thisItem.genre
            self.changedItem.modelNumber = self.modelNumber.text!
            self.changedItem.price = Int(self.price.text!) ?? self.changedItem.price
            self.changedItem.purchaseDate = self.purchaseDate.text!
            self.changedItem.reason = self.reason.text!
            self.changedItem.confort = Int(self.comfort.text!) ?? self.changedItem.confort
            //Int(self.comfort.text!)!
            self.changedItem.warrantyPeriod = self.warrantyPeriod.text!
            self.changedItem.otherTargets = self.other.text!
            //self.photo.image = UIImage(named:self.thisItem.photo)
            self.changedItem.memo = self.memo.text!
            
            //allitemへの登録
            
            self.changedAllItem.name =
                self.changedItem.name
            //self.genre.text = self.thisItem.genre
            self.changedAllItem.modelNumber =
            self.changedItem.modelNumber
            self.changedAllItem.price =
            self.changedItem.price
            self.changedAllItem.purchaseDate =
            self.changedItem.purchaseDate
            self.changedAllItem.reason =
            self.changedItem.reason
            self.changedAllItem.confort = self.changedItem.confort
            self.changedAllItem.warrantyPeriod =
            self.changedItem.warrantyPeriod
            self.changedAllItem.otherTargets = self.changedItem.otherTargets
            //self.photo.image = UIImage(named:self.thisItem.photo)
            self.changedAllItem.memo =
            self.changedItem.memo
        //self.oldAllItem.setDisposalDate(disposalDate:today.String(from:now))
        
           
           
                
            try! realm.write(){
                realm.add(self.changedItem)
                realm.add(self.changedAllItem)
            }
        
            //Homeに移動
            let nextStoryBoard = UIStoryboard(name: "Home", bundle: nil)
            let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "HomeViewControllerID")
            self.wireframe.transition(to: nextViewController)
    }
    

}
