//
//  AgreementViewDesign.swift
//  spoddify
//
//  Created by 김유진 on 2021/04/15.
//

import UIKit

class AgreementViewDesign: UIView{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = self.frame.height/2
    }
}
