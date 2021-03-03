//
//  NextButtonDesign.swift
//  spoddify
//
//  Created by 김유진 on 2021/02/18.
//

import UIKit

class NextButtonDesign: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 27.0;
        self.layer.masksToBounds = false
    }
}
