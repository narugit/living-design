//
//  Footer.swift
//  LivingDesign
//
//  Created by naru on 2019/11/02.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit
import RealmSwift

class Footer: UIView {
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    let realm = try! Realm()
    
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Footer", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func touchUpInsideHistoryButton(_ sender: Any) {
        let deleteCandidateItems = realm.objects(DeleteCandidateItem.self)

        if(deleteCandidateItems.first != nil){
            for dci in deleteCandidateItems{
                try! realm.write {
                    realm.delete(dci)
                }
            }
        }
        
        let nextStoryBoard = UIStoryboard(name: "History", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "HistoryViewControllerID")
        self.wireframe.transition(to: nextViewController)
    }
    
    @IBAction func touchUpInsideHomeButton(_ sender: Any) {
        let deleteCandidateItems = realm.objects(DeleteCandidateItem.self)

        if(deleteCandidateItems.first != nil){
            for dci in deleteCandidateItems{
                try! realm.write {
                    realm.delete(dci)
                }
            }
        }
        
        let nextStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "HomeViewControllerID")
        self.wireframe.transition(to: nextViewController)
    }
    
    
    @IBAction func touchUpInsideSettingButton(_ sender: Any) {
        let deleteCandidateItems = realm.objects(DeleteCandidateItem.self)

        if(deleteCandidateItems.first != nil){
            for dci in deleteCandidateItems{
                try! realm.write {
                    realm.delete(dci)
                }
            }
        }
        
        let nextStoryBoard = UIStoryboard(name: "Setting", bundle: nil)
        let nextViewController = nextStoryBoard.instantiateViewController(withIdentifier: "SettingViewControllerID")
        self.wireframe.transition(to: nextViewController)
    }
}
