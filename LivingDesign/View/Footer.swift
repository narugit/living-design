//
//  Footer.swift
//  LivingDesign
//
//  Created by naru on 2019/11/02.
//  Copyright © 2019 DSN. All rights reserved.
//

import UIKit

class Footer: UIView {
    @IBOutlet weak var settingsButton: UIButton!
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

}
