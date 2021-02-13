//
//  UIAlertController+Extension.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2021/2/13.
//

import UIKit

extension UIAlertController {
    /// スタイルを指定してアラートを表示
    /// - Parameters:
    ///   - vc: アラートを表示させるViewController
    ///   - title: アラートタイトル
    ///   - message: アラートサブタイトル（メッセージ）
    ///   - preferredStyle: アラートスタイル（基本は.alert、.actionSheetの2種類）
    ///   - okBtnLabel: OKボタンの名前
    ///   - cancelBtnLabel: Cancelボタンの名前（nilにするとOKボタンのみ表示）
    ///   - completion: OKボタン押下後の処理（nilにすると特に処理は無し）
    internal static func showAlertView(vc: UIViewController, title: String?, message: String?, preferredStyle: UIAlertController.Style, okBtnLabel: String, cancelBtnLabel: String?, completion: (() -> Void)?) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        // キャンセルボタン押下時の処理（キャンセルボタン無しのパターンも考慮）
        if let cancelBtnLabel: String = cancelBtnLabel {
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelBtnLabel, style: .cancel, handler: { (action: UIAlertAction) -> Void in
            })
            // Actionにキャンセルボタンを追加
            alert.addAction(cancelAction)
        }
        // OKボタン押下時の処理
        let okAction: UIAlertAction = UIAlertAction(title: okBtnLabel, style: .default, handler: { (action: UIAlertAction) -> Void in
            if let completion = completion {
                completion()
            }
        })
        // ActionにOKボタンを追加
        alert.addAction(okAction)
        // アラート表示
        vc.present(alert, animated: true, completion: nil)
    }
}
