//
//  TweetTableViewCell.swift
//  atodekesu
//
//  Created by goggle CL on 2024/08/25.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet var tweetTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
