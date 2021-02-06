//
//  TapCopyViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//

/*
 * このクラスで実装されている主な機能
 *   - Labelのテキストを長押ししてコピーできる機能...UILabelのカスタムclassで実装
 *   - キーボードに閉じるボタン（name="完了"）を追加する処理...UITextViewのextensionで実装
 *   - キーボード外をタップして閉じる処理
 *   - TextViewをテキスト表示のみにする処理...UITextViewのextensionで実装
 */

import UIKit

class TapCopyViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textCopyView: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    // キーボード外をタップした時の閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.endEditing(true)
    }
}
// MARK: - Private Method
extension TapCopyViewController {
    private func setUI() {
        // キーボードに完了ボタンを設定
        self.textView.setDoneButton()
        // キーボードタイプをdefaultの日本語-ローマ字に設定
        self.textView.keyboardType = .default
        // textViewのフォントスタイルを設定
        //（storyboardだけの設定だとfont styleがtimes new romanになるバグがあるため）
        self.textView.font = UIFont.systemFont(ofSize: 17.0)
        self.textCopyView.font = UIFont.systemFont(ofSize: 17.0)
        // テキスト表示用のtextCopyViewのタップ処理
        self.textCopyView.isEditable = false
        self.textCopyView.isScrollEnabled = false
        self.textCopyView.textContainer.maximumNumberOfLines = self.textCopyView.getNumberOfLines()
        self.textCopyView.textContainer.lineBreakMode = .byTruncatingTail
        
    }
}
