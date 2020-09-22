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
        // キーボードに完了ボタンを設定
        self.textView.setDoneButton()
    }
    // キーボード外をタップした時の閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.endEditing(true)
    }
}
