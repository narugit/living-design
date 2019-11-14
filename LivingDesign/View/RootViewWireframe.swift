//
//  RootViewWireframe.swift
//  LivingDesign
//
//  Created by naru on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit
import RealmSwift

internal protocol Wireframe {
    func transition(to viewController: UIViewController)
    func transition(to viewController: UIViewController, data: String)
}

internal struct RootViewWireframe: Wireframe {

    func transition(to viewController: UIViewController) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController: RootViewController = appDelegate.window!.rootViewController as! RootViewController
        
        if !rootViewController.children.isEmpty {
            rootViewController.children.forEach { (childViewController: UIViewController) in
                childViewController.willMove(toParent: nil)
                UIView.transition(with: rootViewController.view, duration: 0.1, options: [.transitionCrossDissolve], animations: {
                    childViewController.view.removeFromSuperview()
                }, completion: nil)
                childViewController.removeFromParent()
            }

        }
        
        rootViewController.addChild(viewController)
        viewController.view.frame = UIScreen.main.bounds
        UIView.transition(with: rootViewController.view, duration: 0.1, options: [.transitionCrossDissolve], animations: {
            rootViewController.view.addSubview(viewController.view)
        }, completion: nil)
        viewController.didMove(toParent: viewController)
    }
    
    func transition(to viewController: UIViewController, data: String) {
        let realm = try! Realm()
        let shareData = realm.objects(ShareInNavigation.self).first
        
        if(shareData == nil){
            print("ShareInNavigationが空")
            let sd = ShareInNavigation()
            sd.data = data
            try! realm.write {
                realm.add(sd)
            }
        }else{
            print("ShareInNavigationを更新")
            try! realm.write {
                shareData?.data = data
            }
        }
        
        // TODO: データ1個もなかったら作成するっていう分岐を用意する
        
        
        transition(to: viewController)
    }
}
