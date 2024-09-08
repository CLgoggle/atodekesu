//
//  AddTweetViewController.swift
//  atodekesu
//
//  Created by goggle CL on 2024/08/25.
//

import UIKit
import RealmSwift

class AddTweetViewController: UIViewController {
    
    @IBOutlet var tweetTextView: UITextView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    @IBAction func postTweet(_ sender: Any) {
        saveInputText()
        showAlert()
    }
    
    func saveInputText() {
        guard let setTweetText = tweetTextView.text else {return}
        
        let tweet = Tweet()
        tweet.tweetText = setTweetText
        try! realm.write({
            realm.add(tweet)
        })
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "保存",message:"保存されました",preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true,completion: nil)
    }
    
}


