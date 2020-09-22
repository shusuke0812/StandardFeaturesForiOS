//
//  UITextView+Extension.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//

import UIKit

extension UITextView {
    /// キーボード上に「完了」ボタンを設定
    internal func setDoneButton() {
        // キーボード上に完了ボタンを設置するスペース（ツールバー）を設定
        let toolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0))
        // 画面幅に合わせる
        toolBar.sizeToFit()
        // 完了ボタンを右に寄せる
        let spacer: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // 完了ボタン
        let doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(tapDoneButton))
        
        toolBar.items = [spacer, doneButton]
        self.inputAccessoryView = toolBar
    }
    /// キーボードの完了ボタンをタップ時の閉じる処理
    @objc private func tapDoneButton(sender: UIButton) {
        self.endEditing(true)
    }
    
    /// 行数を取得する
    internal func getNumberOfLines() -> Int {
        let numberOfGlyphs: Int = self.layoutManager.numberOfGlyphs
        var index: Int = 0
        var numberOfLines: Int = 1
        var lineRange = NSRange(location: NSNotFound, length: 0)
        while index < numberOfGlyphs {
            self.layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &lineRange)
            index = NSMaxRange(lineRange)
            numberOfLines += 1
        }
        return numberOfLines
    }
}
