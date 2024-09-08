//
//  ViewController.swift
//  atodekesu
//
//  Created by goggle CL on 2024/07/28.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        authenticateUser()
    }
    
    private func authenticateUser() {
        let laContext = LAContext()
        var authError: NSError?
        
        // デバイスの認証ポリシーが評価可能かを確認
        guard laContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) else {
            print("Authentication not available: \(authError?.localizedDescription ?? "Can't evaluate policy")")
            return
        }
        
        let reason = "Log in to your account"
        
        laContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
            // メインスレッドでの実行を確実にするために DispatchQueue.main.async を使用
            DispatchQueue.main.async {
                if success {
                    print("Authentication successful!")
                    self.performSegue(withIdentifier: "Next", sender: nil)
                } else {
                    print("Authentication failed: \(error?.localizedDescription ?? "Failed to evaluate policy")")
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Next" {
            // 必要な処理があればここに記述
        }
    }
}
