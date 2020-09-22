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

    @IBOutlet weak var saleTimeDetailLabel: UILabel!
    private var showSaleTimeDetail: Bool = true
    
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
    }
    
}
