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
import PickerButton

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
    @IBOutlet weak var genre: PickerButton!
    @IBOutlet weak var genreRect: UIView!
    
    
    var newItem: Item = Item()
    var newAllItem: AllItem = AllItem()
    var currentSelected: Int?
    let realm = try! Realm()
    var id: String?
    
    private let wireframe: RootViewWireframe = RootViewWireframe()

    var genreValues = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let smallGenreInRealm = realm.objects(SmallGenre.self)
        
        for sgr in smallGenreInRealm{
            genreValues.append(sgr.name)
        }
        
        self.genreRect.layer.borderColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0).cgColor
        self.genreRect.layer.cornerRadius = 5.0;
        self.genreRect.layer.borderWidth = 1.0
        
        self.genre.delegate = self
        self.genre.dataSource = self
    }
    
    @IBAction func TouchUpInsideReturnButton(_ sender: Any) {
    }
    
    @IBAction func TouchUpInsideRegisterButton(_ sender: Any) {
      
        let realm = try! Realm()
        print(newItem)
        
        
        self.newItem.name =
            self.name.text!
        self.newItem.genre = self.genre.currentTitle!
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
        self.newAllItem.genre = self.newItem.genre
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

extension NewProduct: UIPickerViewDelegate, UIPickerViewDataSource {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreValues[row]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreValues.count
    }
}
