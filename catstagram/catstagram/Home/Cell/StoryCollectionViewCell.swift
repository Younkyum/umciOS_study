//
//  StoryCollectionViewCell.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/04/08.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewImageViewBackground: UIView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewImageViewBackground.clipsToBounds = true
        imageViewUserProfile.clipsToBounds = true
        imageViewUserProfile.clipsToBounds = true
    }

}
