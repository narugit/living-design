//
//  Edit.swift
//  LivingDesign
//
//  Created by 荒木大晴 on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import PickerButton

class Edit: UIViewController {
    
   
    //@IBOutlet weak var productImage: UIImageView!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var modelNumber: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var purchaseDate: UITextField!
    @IBOutlet weak var reason: UITextField!
    @IBOutlet weak var genre: PickerButton!
    
    @IBOutlet weak var comfort: UITextField!
    @IBOutlet weak var otherTargets: UITextField!
    @IBOutlet weak var warrantyPeriod: UITextField!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var memo: UITextField!
    @IBOutlet weak var genreRect: UIView!
    
    var thisItem: Item = Item()
    var thisAllItem: AllItem = AllItem()
    var currentSelected : Int?
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    var genreValues = [SmallGenre()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        let smallGenreInRealm = realm.objects(SmallGenre.self)
        
        for sgr in smallGenreInRealm{
            genreValues.append(sgr)
        }
        
        self.genreRect.layer.borderColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0).cgColor
        self.genreRect.layer.cornerRadius = 5.0;
        self.genreRect.layer.borderWidth = 1.0
        
        self.genre.delegate = self
        self.genre.dataSource = self
        
        let shareData = realm.objects(ShareInNavigation.self).first
        print(shareData!.data)
        let inputId:String = shareData!.data
        thisItem = realm.objects(Item.self).filter("id == %@",inputId).first!
        print(thisItem)
        self.name.text = self.thisItem.name
        self.genre.setTitle(self.thisItem.genre, for: .normal)
        self.modelNumber.text = self.thisItem.modelNumber
        self.price.text = self.thisItem.price < 0 ? "" :String(self.thisItem.price)
        self.purchaseDate.text = self.thisItem.purchaseDate
        self.reason.text = self.thisItem.reason
        self.comfort.text =
            self.thisItem.confort < 0 ? "" :String(self.thisItem.confort)
        self.warrantyPeriod.text = self.thisItem.warrantyPeriod
        self.otherTargets.text = self.thisItem.otherTargets
        self.photo.image = UIImage(named:self.thisItem.photo)
        //self.memo.text = self.thisItem.memo
        }
        
    @IBAction func TouchUpInsideReturnButton(_ sender: Any) {
        }
    

    @IBAction func TouchUpInsideRegisterButton(_ sender: Any) {
        //thisItemに書き込み
        let realm = try! Realm()
        thisAllItem = realm.objects(AllItem.self).filter("id == %@",thisItem.getId()).first!
        
        try! realm.write(){
            self.thisItem.name =
                self.name.text!
            self.thisItem.genre = self.genre.titleLabel!.text!
            self.thisItem.modelNumber = self.modelNumber.text!
            self.thisItem.price = Int(self.price.text!) ?? 0
            self.thisItem.purchaseDate = self.purchaseDate.text!
            self.thisItem.reason = self.reason.text!
            self.thisItem.confort = Int(self.comfort.text!) ?? 0
            self.thisItem.warrantyPeriod = self.warrantyPeriod.text!
            self.thisItem.otherTargets = self.otherTargets.text!
            let selectedGenre = genreValues.filter({ $0.name == self.thisItem.genre }).first as! SmallGenre
            self.thisItem.photo = selectedGenre.photoName
            //self.thisItem.memo = self.memo.text!
            
            //allitemへの登録
            
            self.thisAllItem.name =
                self.thisItem.name
            self.thisItem.genre = self.genre.currentTitle!
            self.thisAllItem.modelNumber =
            self.thisItem.modelNumber
            self.thisAllItem.price =
            self.thisItem.price
            self.thisAllItem.purchaseDate =
            self.thisItem.purchaseDate
            self.thisAllItem.reason =
            self.thisItem.reason
            self.thisAllItem.confort = self.thisItem.confort
            self.thisAllItem.warrantyPeriod =
            self.thisItem.warrantyPeriod
            self.thisAllItem.otherTargets = self.thisItem.otherTargets
            self.thisAllItem.photo = selectedGenre.photoName
            //self.thisAllItem.memo =
            //self.thisItem.memo
        }
        
        //Homeに移動
        let nextStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "HomeViewControllerID")
        self.wireframe.transition(to: nextViewController)
        
    }
    
    
    
}

extension Edit: UIPickerViewDelegate, UIPickerViewDataSource {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreValues[row].name
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row != 0){
            self.photo.image = UIImage(named: genreValues[row].photoName)
        }
    }
}
