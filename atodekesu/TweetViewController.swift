//
//  TweetViewController.swift
//  atodekesu
//
//  Created by goggle CL on 2024/08/25.
//

import UIKit
import RealmSwift

class TweetViewController: UIViewController , UITableViewDataSource{
    
    let realm = try! Realm()
    var tweets = [Tweet]()
    
    @IBOutlet var tableView:UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TweetTableViewCell",bundle: nil), forCellReuseIdentifier: "customCell")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        gettweet()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func gettweet() {
        tweets = Array(realm.objects(Tweet.self)).reversed()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for:indexPath) as! TweetTableViewCell
        let tweet: Tweet = tweets[indexPath.row]
        cell.tweetTextLabel.text = tweet.tweetText
        return cell
    }
    

    

}
