//
//  LineButtonDesign.swift
//  spoddify
//
//  Created by 김유진 on 2021/02/18.
//


import UIKit

class LineButtonDesign: UIButton{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 27.0;
        self.layer.masksToBounds = false
        self.layer.borderColor = CGColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        self.layer.borderWidth = 1.0
    }
}
