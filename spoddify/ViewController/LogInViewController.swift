//
//  LogInViewController.swift
//  spoddify
//
//  Created by 김유진 on 2021/04/16.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var emailOrUserNameTFBg: TextfieldViewDesign!
    @IBOutlet weak var passwardTFBg: TextfieldViewDesign!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWithoutPasswardButton: UIButton!
    @IBOutlet weak var emailorUserName: UITextField!
    @IBOutlet weak var passwardTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailorUserName.delegate = self
        passwardTF.delegate = self
        
        loginButton.layer.cornerRadius = 25
        
        loginWithoutPasswardButton.layer.cornerRadius = 15
        loginWithoutPasswardButton.layer.borderWidth = 2
        loginWithoutPasswardButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwardTF{
            passwardTFBg.backgroundColor = .darkGray
        }else if textField == emailorUserName{
            emailOrUserNameTFBg.backgroundColor = .darkGray
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwardTF{
            passwardTFBg.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
        }else if textField == emailorUserName{
            emailOrUserNameTFBg.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
        }
    }
}
