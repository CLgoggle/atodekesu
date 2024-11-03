import Foundation
import UIKit

// アラートを表示する関数
func showAlert(on viewController: UIViewController, title: String, message: String, shouldGoBack: Bool) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

    // OKボタンの追加
    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        if shouldGoBack {
            // ナビゲーションスタックで前の画面に戻る
            viewController.navigationController?.popViewController(animated: true)
        }
    }
    alert.addAction(okAction)

    // アラートの表示
    viewController.present(alert, animated: true, completion: nil)
}
