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
        textView.setDoneButton()
    }
}
