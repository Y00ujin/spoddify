//
//  LoginWithoutPwViewController.swift
//  spoddify
//
//  Created by 김유진 on 2021/04/17.
//

import UIKit

class LoginWithoutPwViewController: UIViewController{
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailOrUserNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 25
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
