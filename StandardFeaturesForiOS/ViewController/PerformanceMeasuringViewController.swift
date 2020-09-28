//
//  PerformanceMeasuringViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/28.
//

import UIKit

class PerformanceMeasuringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PerformanceMeasuringViewController {
    /// メソッドの処理時間を計測する（単一スレッドの場合のみ有効？）
    internal func performanceMeasuring() {
        let beginDate = Date()
        // 計測したいメソッドを書く
        let endDate = Date()
        let time = endDate.timeIntervalSince(beginDate)
        print("DEBUG： \(time)")
    }
}
