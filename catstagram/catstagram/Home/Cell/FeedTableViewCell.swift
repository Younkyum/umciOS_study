//
//  FeedTableViewCell.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/04/04.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var buttonisHeart: UIButton!
    @IBOutlet weak var buttonisBookmark: UIButton!
    @IBOutlet weak var labelHowManyLike: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageViewUserProfile.layer.conerRadius = 22.5
//        imageViewUserProfile.clipsToBounds = true
//        imageViewMyProfile.layer.conerRadius = 22.5
//        imageViewMyProfile.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


