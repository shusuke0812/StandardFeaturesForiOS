//
//  PerformanceMeasuringViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/28.
//

import UIKit
import os.signpost

class PerformanceMeasuringViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapStartPerformanceMesuringButton(_ sender: Any) {
        self.osLong()
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
    /// os.singpostによる処理時間の計測（結果はXcodeのInstrumentsのTimeProfilerで見る）
    internal func osLong() {
        let osLog: OSLog = OSLog(subsystem: "jp.shusuke.ota.StandardFeaturesForiOS.StandardFeaturesForiOS", category: "loop")
        os_signpost(.begin, log: osLog, name: "sample")
        // 計測したいメソッドを書く
        self.sample()
        os_signpost(.end, log: osLog, name: "sample")
    }
    private func sample() {
        for i in 0 ..< 10000000 {
            print(i)
        }
    }
}
