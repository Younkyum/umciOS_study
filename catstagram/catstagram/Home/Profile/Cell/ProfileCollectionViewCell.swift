//
//  ProfileCollectionViewCell.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/04/11.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupAttribute() {
        profileImageView.clipsToBounds = true
        addProfileImageView.clipsToBounds = true
        
        
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        editButton.clipsToBounds = true
        
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach { $0.text = "\(Int.random(in: 1...10))"}
    }
}
