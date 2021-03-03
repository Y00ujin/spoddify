//
//  TextfieldViewDesign.swift
//  spoddify
//
//  Created by 김유진 on 2021/02/18.
//

import UIKit

class TextfieldViewDesign: UIButton{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 4.5;
        self.layer.masksToBounds = false
    }
}

