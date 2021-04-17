//
//  playlistCollectionViewCell.swift
//  spoddify
//
//  Created by 김유진 on 2021/04/17.
//

import UIKit

class playlistCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var playlistBackgroundView: UIView!
    @IBOutlet weak var playlistImage: UIImageView!
    @IBOutlet weak var playlistTitleLabel: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playlistBackgroundView.layer.cornerRadius = 5
//        playlistImage.layer.cornerRadius = 5
//        playlistImage.layer.masksToBounds = true
    }
}
