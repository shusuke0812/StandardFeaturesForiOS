//
//  AccordionMenuViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//

/*
 * このクラスで実装されている主な機能
 *   - ボタンを押すと隠れているテキストが表示される機能
 */

import UIKit

class AccordionMenuViewController: UIViewController {

    // アコーディオンメニュー
    @IBOutlet weak var saleTimeDetailLabel: UILabel!
    private var showSaleTimeDetail: Bool = true
    
    // もっと見る
    @IBOutlet weak var onTextView: UIView!
    @IBOutlet weak var onTextViewForUITextView: UIView!
    @IBOutlet weak var onTextStackViewForUITextView: UIStackView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    // MARK: - Action Method
    @IBAction func showSaleTimeDetailButton(_ sender: Any) {
        self.showSaleTimeDetail = !showSaleTimeDetail
        UIView.animate(withDuration: 0.3) {
            self.saleTimeDetailLabel.isHidden = !self.showSaleTimeDetail
        }
    }
    @IBAction func moreReadButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.onTextView.isHidden.toggle()
        }
    }
    @IBAction func moreReadButtonForUItextView(_ sender: Any) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.onTextViewForUITextView.isHidden.toggle()
            // もっと見るボタン押下後に長押ししてテキスト・選択できるようにする
            self.onTextStackViewForUITextView.isHidden.toggle()
        }
    }
}
// MARK: - Setting UI Method
extension AccordionMenuViewController {
    private func setUI() {
        // textViewのフォントスタイルを設定
        //（storyboardだけの設定だとfont styleがtimes new romanになるバグがあるため）
        self.textView.font = UIFont.systemFont(ofSize: 14.0)
    }
}
