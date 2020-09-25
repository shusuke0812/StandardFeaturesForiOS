//
//  AlertViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/25.
//

/*
 * このクラスで実装されている主な機能
 *   -
 */

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: -Action Method
    @IBAction func showAlertButton(_ sender: Any) {
        self.showAlert()
    }
}

extension AlertViewController {
    private func showAlert() {
        // アラートスタイル設定
        let alert: UIAlertController = UIAlertController(title: "タイトル", message: "サブタイトル（メッセージ）", preferredStyle: .alert)
        // OKボタンが押された時の処理
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) -> Void in
            // OKボタン押下後に実行
            print("DEBUG： OKボタンが押されました")
        })
        // キャンセルボタンが押された時の処理
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: { (action: UIAlertAction!) -> Void in
            // キャンセルボタン押下後に実行
            print("DEBUG： キャンセルボタンが押されました")
        })
        // OKボタンとキャンセルボタンをActionに追加
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        // Alert表示
        self.present(alert, animated: true, completion: nil)
    }
}
