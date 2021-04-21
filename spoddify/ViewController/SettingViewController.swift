//
//  settingViewController.swift
//  spoddify
//
//  Created by 김유진 on 2021/04/19.
//

import UIKit

class SettingViewController: UIViewController{
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    
    var settingLabel = ["데이터 세이버", "계정", "재생하기","유해성 콘텐츠","디바이스","자동차","공개 범위","앱에 연결하기","오디오 품질","저장 공간","알림","광고", "저장 파일", "상세정보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = 25
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController")
        
        self.navigationController?.pushViewController(loginViewController!, animated: true)
    }
    
    @IBAction func profileButton(_ sender: Any) {
        print("profileButton cliked")
        profileButton.layer.backgroundColor = UIColor.black.cgColor
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        cell.settingLabel?.text = settingLabel[indexPath.row]
        
        return cell
    }
}

