//
//  HealthCareViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2021/2/13.
//

import UIKit
import HealthKit

class HealthCareViewController: UIViewController {
    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let healthStore = HKHealthStore()
        healthStore.requestAuthorization(toShare: writeData, read: readData) { status, error in
            if status {
                print("DEBUG: 認証済み")
            } else {
                print("DEBUG: 認証拒否")
            }
        }
    }
}
