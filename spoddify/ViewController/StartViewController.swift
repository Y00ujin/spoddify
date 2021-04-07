//
//  StartViewController.swift
//  spoddify
//
//  Created by 김유진 on 2021/03/03.
//

import UIKit

class StartViewController: UIViewController {

    //MARK: Outlet
    @IBOutlet weak var joinButton: GreenButtonDesign!
    @IBOutlet weak var fackbookJoinButton: LineButtonDesign!
    @IBOutlet weak var appleJoinButton: LineButtonDesign!
    @IBOutlet weak var googleJoinButton: LineButtonDesign!
    @IBOutlet weak var LoginButton: UIButton!
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: preferredStatusBarStyle
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }

    //MARK: signUpButton
    @IBAction func signUpButton(_ sender: Any) {
        currentView = "email"
    }
}
