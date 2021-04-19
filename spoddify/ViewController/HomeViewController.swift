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
    @IBOutlet weak var playlistRecentlyPlayedCollectionView: UICollectionView!
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistCollectionView.delegate = self
        playlistCollectionView.dataSource = self
        
        playlistRecentlyPlayedCollectionView.delegate = self
        playlistRecentlyPlayedCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        
        playlistRecentlyPlayedCollectionView.collectionViewLayout = layout
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == playlistCollectionView{
            return 6
        }else if collectionView == playlistRecentlyPlayedCollectionView{
            return 10
        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == playlistCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playlistCollectionViewCell", for: indexPath) as! playlistCollectionViewCell
            
            return cell
        }else if collectionView == playlistRecentlyPlayedCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playlistRecentlyPlayedCollectionViewCell", for: indexPath) as! playlistRecentlyPlayedCollectionViewCell
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        if collectionView == playlistCollectionView{
            let itemsPerRow: CGFloat = 1.85
            let widthPadding = sectionInsets.left * (itemsPerRow + 1)
            let itemsPerColumn: CGFloat = 3
            let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
            
            let cellWidth = (width - widthPadding) / itemsPerRow
            let cellHeight = (height - heightPadding) / itemsPerColumn
            
            return CGSize(width: cellWidth, height: cellHeight)
        }else if collectionView == playlistRecentlyPlayedCollectionView{
            let itemsPerRow: CGFloat = 2.3
            let widthPadding = sectionInsets.left * (itemsPerRow + 1)
            let itemsPerColumn: CGFloat = 1
            let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
            
            let cellWidth = (width - widthPadding) / itemsPerRow
            let cellHeight = (height - heightPadding) / itemsPerColumn
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        return CGSize()
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == playlistCollectionView{
            return sectionInsets.left
        }
        return CGFloat()
    }
}
