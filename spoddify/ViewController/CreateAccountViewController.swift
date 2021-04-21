//
//  CreateAccountViewController.swift
//  spoddify
//
//  Created by 김유진 on 2021/02/19.
//

import UIKit

var currentView: String = ""

class CreateAccountViewController: UIViewController{
    
    //MARK: Outlet
    @IBOutlet weak var esentialAgreement: UIView!
    @IBOutlet weak var textFieldBackground: UIView!
    @IBOutlet weak var passwardBackground: UIView!
    @IBOutlet weak var sexView: UIView!
    @IBOutlet weak var birthView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var nicknameView: UIView!
    @IBOutlet weak var passwardView: UIView!
    @IBOutlet weak var sexSelectionView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkbutton: UIImageView!
    @IBOutlet weak var passwardStateLabel: UILabel!
    @IBOutlet weak var emailStateTextView: UITextView!
    @IBOutlet weak var passwardShowButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var birthCheck: UIImageView!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var agreementView: UIView!
    @IBOutlet weak var spoddifyUseAgreementButton: AgreementButtonDesign!
    @IBOutlet weak var personalInfoCollectionAndUseAgreementButton: AgreementButtonDesign!
    @IBOutlet weak var dataProvideAgreementButton: AgreementButtonDesign!
    @IBOutlet weak var spoddifyUseAgreementBg: AgreementViewDesign!
    @IBOutlet weak var personalInfoCollectionAndUseAgreementBg: AgreementViewDesign!
    @IBOutlet weak var dataProvideAgreementBg: AgreementViewDesign!
    @IBOutlet weak var madeAccount: UIButton!
    
    
    //MARK: var, let
    var textFieldDidBeginEditing: Bool = false
    var showPasswardButtonClick: Bool = false
    var agreementButtonIsSelected: [Bool] = [false, false, false]
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        womenButton.layer.cornerRadius = 10
        menButton.layer.cornerRadius = 10
        
        sexSelectionView.isHidden = true
        
        sexTextField.text = "여자"
        
        madeAccount.layer.cornerRadius = 24
        
        esentialAgreement.layer.cornerRadius = 3
        
        agreementView.isHidden = true
        
        birthDatePicker.isHidden = true
        
        birthCheck.isHidden = true
        
        birthTextField.isEnabled = false
        
        birthTextField.textColor = .white
        
        nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        nextButton.layer.cornerRadius = 24
        
        emailTextField.delegate = self
        passwardTextField.delegate = self
        birthTextField.delegate = self
        sexTextField.delegate = self
        nicknameTextField.delegate = self
        
        passwardTextField.isSecureTextEntry = true
        
        let eyeImage = UIImage(systemName: "eye.slash")
        passwardShowButton.setImage(eyeImage, for: .normal)
        
        showPasswardButtonClick = true
        
        checkbutton.isHidden = true
        
        textFieldBackground.layer.cornerRadius = 5
        passwardBackground.layer.cornerRadius = 5
        
        currentView = "email"
        
        madeAccount.isEnabled = false
    }
    @IBAction func womenButton(_ sender: Any) {
        sexTextField.text = "여자"
    }
    
    @IBAction func menButton(_ sender: Any) {
        sexTextField.text = "남자"
    }
    
    //MARK: birthDatePicker
    @IBAction func birthDatePicker(_ sender: Any) {
        birthDatePicker.addTarget(self, action: #selector(changed), for: .valueChanged)
    }
    
    @objc func changed() {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .long
        dateformatter.dateFormat = "YYYY년 M월 d일"
        let date = dateformatter.string(from: birthDatePicker.date)
        birthTextField.text = date
        nextButton.backgroundColor = UIColor.white
    }
    
    //MARK: Status Bar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .darkContent
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
        }else if currentView == "sex"{
            UIView.animate(withDuration: 1){
                self.birthView.center = CGPoint(x: 209, y: 170)
                self.sexView.center = CGPoint(x:715, y: 170)
                self.nextButton.backgroundColor = .white
            }
            sexSelectionView.isHidden = true
            currentView = "birth"
            print("currentView - \(currentView)")
        }else if currentView == "nickname"{
            UIView.animate(withDuration: 1){
                self.sexView.center = CGPoint(x: 209, y: 170)
                self.nicknameView.center = CGPoint(x:715, y: 170)
                self.nextButton.backgroundColor = .white
            }
            currentView = "sex"
            print("currentView - \(currentView)")
            agreementView.isHidden = true
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
            birthDatePicker.isHidden = false // DatePicker보이게 하기
        }else if currentView == "birth" {
            birthDatePicker.isHidden = true
            UIView.animate(withDuration: 0.8){
                self.sexView.center = CGPoint(x: 209, y: 170)
                self.birthView.center = CGPoint(x: -415, y: 170)
                self.nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
            }
            currentView = "sex"
            sexSelectionView.isHidden = false
            nextButton.backgroundColor = .white
            print("currentView - \(currentView)")
        }else if currentView == "sex"{
            UIView.animate(withDuration: 0.8){
                self.nicknameView.center = CGPoint(x: 209, y: 170)
                self.sexView.center = CGPoint(x: -415, y: 170)
            }
            currentView = "nickname"
            nextButton.isHidden = true
            sexSelectionView.isHidden = true
            print("currentView - \(currentView)")
            agreementView.isHidden = false
        }else if currentView == "nickname"{
            
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
    
    //MARK: Agreement Button
    @IBAction func spoddifyUseAgreementButton(_ sender: Any) {
        isValidButton(textField: nicknameTextField)
        agreementButtonIsSelected(arrayIndex: 0, button: spoddifyUseAgreementButton, view: spoddifyUseAgreementBg)
        agreementButtonMoveAnimation(arrayIndex: 0, button: spoddifyUseAgreementButton)
    }
    
    @IBAction func personalInfoCollectionAndUseAgreementButton(_ sender: Any) {
        
        agreementButtonIsSelected(arrayIndex: 1, button: personalInfoCollectionAndUseAgreementButton, view: personalInfoCollectionAndUseAgreementBg)
        agreementButtonMoveAnimation(arrayIndex: 1, button: personalInfoCollectionAndUseAgreementButton)
        isValidButton(textField: nicknameTextField)
    }
    
    @IBAction func dataProvideAgreementButton(_ sender: Any) {
        
        agreementButtonIsSelected(arrayIndex: 2, button: dataProvideAgreementButton, view: dataProvideAgreementBg)
        agreementButtonMoveAnimation(arrayIndex: 2, button: dataProvideAgreementButton)
        isValidButton(textField: nicknameTextField)
    }
    
    //MARK: isValid
    func isValidEmail(testStr:String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidButton(textField:UITextField){
        if textField.text?.isEmpty == false{
            var agreementCount = 0
            for i in 0 ... 1{
                if agreementButtonIsSelected[i] == true{
                    agreementCount += 1
                }
            }
            print(agreementCount)
            if agreementCount == 2{
                madeAccount.backgroundColor = .white
                madeAccount.isEnabled = true
            }else{
                nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
                madeAccount.isEnabled = false
            }
        }else{
            nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        }
    }
    
    func isValidPassward(testStr: String) -> Bool {
        let passwordRegEx = "(?=.*[A-Za-z])(?=.*[0-9]).{8,20}"
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordtesting.evaluate(with: testStr)
    }
    
    func isValidBirth(testStr: String) -> Bool{
        let birthRegEx = ""
        let birthTest = NSPredicate(format: "SELF MATCHES %@", birthRegEx)
        
        return birthTest.evaluate(with: testStr)
    }
    
    func agreementButtonIsSelected(arrayIndex: Int, button: UIButton, view: UIView){
        if agreementButtonIsSelected[arrayIndex] == false{ // 선택이 안되었을때 선택되었을때
            print("현재 \(index)의 값은 \(agreementButtonIsSelected[arrayIndex])입니다.")
            view.backgroundColor = UIColor(red: 28/255, green: 216/255, blue: 96/255, alpha: 1)
        }else{ // 선택이되었을때 선택되었을때
            print("현재 \(index)의 값은 \(agreementButtonIsSelected[arrayIndex])입니다.")
            view.backgroundColor = UIColor.darkGray
        }
    }
    
    func agreementButtonMoveAnimation(arrayIndex: Int, button: UIButton){
        if agreementButtonIsSelected[arrayIndex] == false{ // 오른쪽으로 이동
            UIView.animate(withDuration: 0.4){
                button.center = CGPoint(x: 24+23/2, y: 3+23/2)
            }
            agreementButtonIsSelected[arrayIndex] = true
            print("현재 \(index)의 값이 \(agreementButtonIsSelected[arrayIndex])로 변환되었습니다.")
        }else{ // 왼쪽으로 이동
            UIView.animate(withDuration: 0.1){
                button.center = CGPoint(x: 2+23/2, y: 3+23/2)
            }
            agreementButtonIsSelected[arrayIndex] = false
            print("현재 \(index)의 값이 \(agreementButtonIsSelected[arrayIndex])로 변환되었습니다.")
        }
        
    }
}

extension CreateAccountViewController: UITextFieldDelegate{
    
    //MARK: textFieldDidBeginEditing
    func textFieldDidBeginEditing(_ textField: UITextField){
        textFieldDidBeginEditing = true
        isValidButton(textField: textField)
        print("textFieldDidBeginEditing")
    }
    
    //MARK: textField - shouldChangeCharactersIn
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location > 0{
            textFieldBackground.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
        }else{
            textFieldBackground.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        }
        
        //MARK: shouldChangeCharactersIn - isValid
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
            // passwardTextField형식과 다르다면
            if isValidPassward(testStr: passwardTextField.text!) != true{
                passwardBackground.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
                passwardTextField.textColor = UIColor(red: 189/255, green: 57/255, blue: 60/255, alpha: 1)
                nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
                passwardTextField.textColor = .white
                passwardBackground.backgroundColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
            }else{
                nextButton.backgroundColor = UIColor.white
            }
        }else if textField == birthTextField{
            nextButton.backgroundColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
        }else if textField == nicknameTextField{
            isValidButton(textField: textField)
        }
        return true
    }
}
