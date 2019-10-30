//
//  RootViewController.swift
//  LivingDesign
//
//  Created by naru on 2019/10/22.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit

final internal class RootViewController: UIViewController {
    private let wireframe: RootViewWireframe = RootViewWireframe()
    private var nextSceneName = "Delete"
    private var nextStoryBoard: UIStoryboard? = nil
    private var nextViewController: UIViewController? = nil
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextStoryBoard = UIStoryboard(name: "\(nextSceneName)", bundle: nil)
        self.nextViewController = self.nextStoryBoard?.instantiateViewController(withIdentifier: "\(nextSceneName)ViewControllerID")
        self.wireframe.transition(to: self.nextViewController!)
    }

}
