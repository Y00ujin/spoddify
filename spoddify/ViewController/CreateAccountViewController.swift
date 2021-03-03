//
//  CreateAccountViewController.swift
//  spoddify
//
//  Created by 김유진 on 2021/02/19.
//

import UIKit

var currentView: String = ""

class CreateAccountViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: Outlet
    @IBOutlet weak var textFieldBackground: UIView!
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var emailStateLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var checkbutton: UIImageView!
    
    @IBOutlet weak var passwardView: UIView!
    
    @IBOutlet weak var passwardBackground: UIView!
    
    @IBOutlet weak var passwardStateLabel: UILabel!
    
    //MARK: var, let
    var textFieldDidBeginEditing: Bool = false
    

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        nextButton.layer.cornerRadius = 24
        
        emailTextField.delegate = self
        
        checkbutton.isHidden = true
        
        textFieldBackground.layer.cornerRadius = 5
        passwardBackground.layer.cornerRadius = 5
        
        currentView = "email"
        
    }
    
    //MARK: Status Bar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        textFieldDidBeginEditing = true
        
        print("textFieldDidBeginEditing")
    }
    
    //MARK: textField - shouldChangeCharactersIn
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location > 0{
            textFieldBackground.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
        }else{
            textFieldBackground.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        }
        
        if isValidEmail(testStr: emailTextField.text!) != true {
            emailTextField.textColor = UIColor(red: 189/255, green: 57/255, blue: 60/255, alpha: 1)
            textFieldBackground.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
            emailStateLabel.text = "이 이메일은 유효하지 않습니다. example@email.com과 같은 형식인지 확인하세요"
            nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
            checkbutton.isHidden = true
        }else{ // email형식이 맞다면
            nextButton.backgroundColor = UIColor.white
            emailStateLabel.text = "나중에 이 이메일 주소를 확인해야 합니다."
            checkbutton.isHidden = false
            emailTextField.textColor = .white
        }
        return true
    }
    
    //MARK: backButton
    @IBAction func backButton(_ sender: Any) {
        if currentView == "email"{
            let PushVC = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController")
            self.navigationController?.pushViewController(PushVC!, animated: true)
            currentView = "start"
            print("currentView - \(currentView)")
        }else if currentView == "passward"{
            UIView.animate(withDuration: 1){
                self.emailView.center = CGPoint(x: 209, y: 170)
                self.textFieldBackground.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
                self.passwardView.center = CGPoint(x: 715, y: 170)
                self.nextButton.backgroundColor = .white
                self.passwardBackground.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
                currentView = "email"
                print("currentView - \(currentView)")
            }
        }
    }
    
    //MARK: nextButton
    @IBAction func nextButton(_ sender: Any) {
        if currentView == "email"{
            UIView.animate(withDuration: 1){
                self.textFieldBackground.backgroundColor = .black
                self.emailView.center = CGPoint(x:-415, y:170)
                self.passwardView.center = CGPoint(x: 209, y: 170)
                self.passwardBackground.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
                self.nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
                currentView = "passward"
                print("currentView - \(currentView)")
            }
        }else if currentView == "passward"{
            
        }
    }
    
    //MARK: touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if textFieldDidBeginEditing == true && emailTextField.text?.isEmpty == true {
            textFieldBackground.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
            emailStateLabel.text = "이메일 주소를 반드시 입력하세요"
        }

   }
    
    //MARK: isValidEmail
    func isValidEmail(testStr:String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    
        return emailTest.evaluate(with: testStr)
    }
}
