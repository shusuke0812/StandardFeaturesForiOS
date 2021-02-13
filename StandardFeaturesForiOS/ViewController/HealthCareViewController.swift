//
//  HealthCareViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2021/2/13.
//

import UIKit
import HealthKit

class HealthCareViewController: UIViewController {
    
    @IBOutlet weak var healthCareConnectionButton: UIButton!
    /// HealthStore
    private let healthStore = HKHealthStore()
    
    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    // MARK: - Action Method
    @IBAction func didTapHealthCareConnectionButton(_ sender: Any) {
        UIAlertController.showAlertView(vc: self, title: "ヘルスケアアプリと\n連携しますか", message: nil, preferredStyle: .alert, okBtnLabel: "OK", cancelBtnLabel: "キャンセル") {
            self.setHealthCareAccess()
        }
    }
}
// MARK: - HealthKit Method
extension HealthCareViewController {
    private func setHealthCareAccess() {
        // 読み込むデータの設定（性別、血液型、歩数）
        let readData: Set<HKObjectType> = [
            HKObjectType.characteristicType(forIdentifier: .biologicalSex)!,
            HKObjectType.characteristicType(forIdentifier: .bloodType)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!
        ]
        // 書き込めるデータの設定（体重）
        let writeData: Set<HKSampleType> = [
            HKSampleType.quantityType(forIdentifier: .bodyMass)!
        ]
        self.healthStore.requestAuthorization(toShare: writeData, read: readData) { status, error in
            if status {
                print("DEBUG: 認証済み")
            } else {
                print("DEBUG: 認証拒否")
            }
        }
    }
}
// MARK: - Setting UI Method
extension HealthCareViewController {
    private func initUI() {
        // 連携ボタンの設定
        self.healthCareConnectionButton.layer.masksToBounds = true
        self.healthCareConnectionButton.layer.cornerRadius = 5
    }
}
