//
//  TapCopyViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//

import UIKit

class TapCopyViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    // キーボード外をタップした時の閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.endEditing(true)
    }
}

extension TapCopyViewController {
    private func setUI() {
        // キーボードに完了ボタンを設定
        self.textView.setDoneButton()
        // キーボードタイプをdefaultの日本語-ローマ字に設定
        self.textView.keyboardType = .default
    }
}
