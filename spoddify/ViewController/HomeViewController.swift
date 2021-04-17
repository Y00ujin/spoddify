//
//  HomeViewController.swift
//  spoddify
//
//  Created by 김유진 on 2021/04/17.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var playlistCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistCollectionView.delegate = self
        playlistCollectionView.dataSource = self
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playlistCollectionViewCell", for: indexPath) as! playlistCollectionViewCell
        
        return cell
    }
    
    
}
