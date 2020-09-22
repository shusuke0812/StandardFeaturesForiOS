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
    @IBOutlet weak var textView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            self.textView.isHidden.toggle()
        }
    }
}
