//
//  AlertViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/25.
//

/*
 * このクラスで実装されている主な機能
 *   - ボタンをタップしたらアラートが表示される
 *   - アラートスタイルは２種類（デフォルト、アクションシート）
 */

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: -Action Method
    @IBAction func showAlertButton(_ sender: Any) {
        self.showDefaultAlert()
    }
    @IBAction func showActionSheetButton(_ sender: Any) {
        self.showActionSheetAlert()
    }
}
// MARK: - Private Method
extension AlertViewController {
    /// デフォルトスタイルのアラート
    private func showDefaultAlert() {
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
    /// アクションシートのアラート
    private func showActionSheetAlert() {
        // アラートスタイル設定
        let alert: UIAlertController = UIAlertController(title: "タイトル", message: "サブタイトル（メッセージ）", preferredStyle: .actionSheet)
        // OKボタンが押された時の処理
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) -> Void in
            // OKボタン押下後の処理
            print("DEBUG： OKボタンが押されました")
        })
        // キャンセルボタンが押された時の処理
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: { (action: UIAlertAction!) -> Void in
            // キャンセルボタン押下後の処理
            print("DEBUG： キャンセルボタンが押されました")
        })
        // OKボタンとキャンセルボタンをActionに追加
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        // Alert表示
        self.present(alert, animated: true, completion: nil)
    }
}
