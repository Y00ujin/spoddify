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
    @IBOutlet weak var passwardBackground: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwardView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkbutton: UIImageView!
    @IBOutlet weak var passwardStateLabel: UILabel!
    @IBOutlet weak var emailStateTextView: UITextView!
    @IBOutlet weak var passwardShowButton: UIButton!
    @IBOutlet weak var birthView: UIView!
    @IBOutlet weak var birthCheck: UIImageView!
    
    //MARK: var, let
    var textFieldDidBeginEditing: Bool = false
    var showPasswardButtonClick: Bool = false
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthCheck.isHidden = true
        
        birthTextField.isEnabled = false
        
        birthTextField.textColor = .white
        
        nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        nextButton.layer.cornerRadius = 24
        
        emailTextField.delegate = self
        passwardTextField.delegate = self
        birthTextField.delegate = self
        passwardTextField.isSecureTextEntry = true
        
        let eyeImage = UIImage(systemName: "eye.slash")
        passwardShowButton.setImage(eyeImage, for: .normal)
        
        showPasswardButtonClick = true
        
        checkbutton.isHidden = true
        
        textFieldBackground.layer.cornerRadius = 5
        passwardBackground.layer.cornerRadius = 5
        
        currentView = "email"
        
    }
    
    //MARK: Status Bar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
    }
    
    //MARK: textFieldDidBeginEditing
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
        
        //MARK: shouldChangeCharactersIn - isValidEmail
        if textField == emailTextField{
            // email형식과 다르다면
            if isValidEmail(testStr: emailTextField.text!) != true {
                emailTextField.textColor = UIColor(red: 189/255, green: 57/255, blue: 60/255, alpha: 1)
                textFieldBackground.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
                emailStateTextView.text = "이 이메일은 유효하지 않습니다. example@email.com과 같은 형식인지 확인하세요"
                nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
                checkbutton.isHidden = true
            }else{ // email형식이 맞다면
                nextButton.backgroundColor = UIColor.white
                emailStateTextView.text = "나중에 이 이메일 주소를 확인해야 합니다."
                checkbutton.isHidden = false
                emailTextField.textColor = .white
            }
        //MARK: shouldChangeCharactersIn - isValidPassward
        }else if textField == passwardTextField{
            // email형식과 다르다면
            if isValidPassward(testStr: passwardTextField.text!) != true{
                passwardBackground.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
                passwardTextField.textColor = UIColor(red: 189/255, green: 57/255, blue: 60/255, alpha: 1)
                nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
            }else{
                nextButton.backgroundColor = UIColor.white
                passwardTextField.textColor = .white
                passwardBackground.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
            }
        }
        return true
    }
    
    //MARK: backButton
    @IBAction func backButton(_ sender: Any) {
        if currentView == "email"{
            print("시작창으로")
            currentView = "start"
            print("currentView - \(currentView)")
            self.navigationController?.popViewController(animated: true)
            
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
        }else if currentView == "birth"{
            UIView.animate(withDuration: 1){
                self.passwardView.center = CGPoint(x: 209, y: 170)
                self.birthView.center = CGPoint(x:715, y: 170)
                self.nextButton.backgroundColor = .white
            }
            currentView = "passward"
            print("currentView - \(currentView)")
        }
    }
    
    //MARK: nextButton
    @IBAction func nextButton(_ sender: Any) {
        if currentView == "email" && isValidEmail(testStr: emailTextField.text!) == true{
            UIView.animate(withDuration: 0.8){
                self.textFieldBackground.backgroundColor = .black
                self.emailView.center = CGPoint(x:-415, y:170)
                self.passwardView.center = CGPoint(x: 209, y: 170)
                self.passwardBackground.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
                if(self.isValidPassward(testStr: self.passwardTextField.text!) != true){
                    self.nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
                }
                currentView = "passward"
                print("currentView - \(currentView)")
            }
        }else if currentView == "passward" && isValidPassward(testStr: passwardTextField.text!) == true{
            UIView.animate(withDuration: 0.8){
                self.passwardView.center = CGPoint(x: -415, y: 170)
                self.birthView.center = CGPoint(x: 209, y: 170)
                self.nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
            }
            currentView = "birth"
            print("currentView - \(currentView)")
        }else{ // 생년월일
            
        }
    }
    
    //MARK: passwardShowButton
    @IBAction func passwardShowButton(_ sender: Any) {
        if(showPasswardButtonClick == true) {
            passwardTextField.isSecureTextEntry = false
            let eyeImage = UIImage(systemName: "eye")
            passwardShowButton.setImage(eyeImage, for: .normal)
        } else {
            passwardTextField.isSecureTextEntry = true
            let eyeImage = UIImage(systemName: "eye.slash")
            passwardShowButton.setImage(eyeImage, for: .normal)
        }

        showPasswardButtonClick = !showPasswardButtonClick
    }
    
    //MARK: touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if textFieldDidBeginEditing == true && emailTextField.text?.isEmpty == true {
            textFieldBackground.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
            emailStateTextView.text = "이메일 주소를 반드시 입력하세요"
        }

   }
    
    //MARK: isValid
    func isValidEmail(testStr:String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPassward(testStr: String) -> Bool {
        let passwordreg = ("(?=.*[A-Za-z])(?=.*[0-9]).{8,20}")
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
        return passwordtesting.evaluate(with: testStr)
    }

}
