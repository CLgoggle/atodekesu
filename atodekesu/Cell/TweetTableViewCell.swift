import UIKit
import RealmSwift

class TweetTableViewCell: UITableViewCell {

    @IBOutlet var tweetTextLabel: UILabel!
    @IBOutlet var tweetDateLabel: UILabel!
    @IBOutlet var tweetImageView: UIImageView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func configureCell() {
        // Load saved data from UserDefaults
        let userDefaults = UserDefaults.standard
        if let profileName = userDefaults.string(forKey: "profileName") {
            profileNameLabel.text = profileName
        } else {
            profileNameLabel.text = "UserName"
        }
        if let profileImagePath = userDefaults.string(forKey: "profileImageURL"){
            profileImageView.image = getImage(tweetImageURL: profileImagePath)
        } else {
            profileImageView.image = UIImage(systemName: "star")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setTweet(tweetText: String?, tweetImageURL: String? , tweetDate: String?) {
        profileImageView.layer.cornerRadius = 25
        tweetTextLabel.text = tweetText
        if let imageURL = tweetImageURL{
            tweetImageView.image = getImage(tweetImageURL: tweetImageURL)
        }else{
            tweetImageView.isHidden = true
        }
        tweetDateLabel.text = tweetDate

    }
}
