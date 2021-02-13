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
    @IBOutlet weak var biologicalSexLabel: UILabel!
    @IBOutlet weak var bloodTypeLabel: UILabel!
    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var bodyMassLabel: UILabel!
    /// HealthStore
    private let healthStore = HKHealthStore()
    /// HealthCare Authフラグ
    private var isHealthCareRequestAuthorization = false
    
    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.updatedHealthCareData()
    }
    // MARK: - Action Method
    @IBAction func didTapHealthCareConnectionButton(_ sender: Any) {
        if !isHealthCareRequestAuthorization {
            UIAlertController.showAlertView(vc: self, title: "ヘルスケアアプリと\n連携しますか", message: nil, preferredStyle: .alert, okBtnLabel: "OK", cancelBtnLabel: "キャンセル") {
                self.setHealthCareAccess { status in
                    if status { self.updatedHealthCareData() }
                }
            }
        } else {
            UIAlertController.showAlertView(vc: self, title: "認証リクエス済みです\n変更は設定画面から！", message: nil, preferredStyle: .alert, okBtnLabel: "OK", cancelBtnLabel: nil, completion: nil)
        }
    }
}
// MARK: - HealthKit Method
extension HealthCareViewController {
    private func setHealthCareAccess(completion: @escaping (Bool) -> Void) {
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
                self.isHealthCareRequestAuthorization = true
                completion(status)
            } else {
                print("DEBUG: 認証拒否")
                completion(status)
            }
        }
    }
    private func updatedHealthCareData() {
        self.readBloodType()
        self.readBiologicalSex()
    }
    /// 性別を読み込む
    private func readBiologicalSex() {
        var biologicalSex: String?
        do {
            let biologicalSextInfo = try self.healthStore.biologicalSex()
            switch biologicalSextInfo.biologicalSex {
            case .male:     biologicalSex = "男性"
            case .female:   biologicalSex = "女性"
            case .notSet:   biologicalSex = "未設定"
            case .other:    biologicalSex = "他"
            default:        print("DEBUG: 性別読み込みエラー")
            }
            if let biologicalSex = biologicalSex {
                DispatchQueue.main.async {
                    self.biologicalSexLabel.text = biologicalSex
                }
            }
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    /// 血液型を読み込む
    private func readBloodType() {
        var bloodType: String?
        do {
            let bloodTypeInfo = try self.healthStore.bloodType()
            switch bloodTypeInfo.bloodType {
            case .aPositive:    bloodType = "A+"
            case .aNegative:    bloodType = "A-"
            case .bPositive:    bloodType = "B+"
            case .bNegative:    bloodType = "B-"
            case .abPositive:   bloodType = "AB+"
            case .abNegative:   bloodType = "AB-"
            case .oPositive:    bloodType = "O+"
            case .oNegative:    bloodType = "O-"
            default:            print("DEBUG: 血液型読み込みエラー")
            }
            if let bloodType = bloodType {
                DispatchQueue.main.async {
                    self.bloodTypeLabel.text = bloodType
                }
            }
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
}
// MARK: - Setting UI Method
extension HealthCareViewController {
    private func initUI() {
        // 連携ボタンの設定
        self.healthCareConnectionButton.layer.masksToBounds = true
        self.healthCareConnectionButton.layer.cornerRadius = 5
        // データを反映する各種ラベルの設定
        let initLabelText = "データがありません"
        self.biologicalSexLabel.text = initLabelText
        self.bloodTypeLabel.text = initLabelText
        self.stepCountLabel.text = initLabelText
        self.bodyMassLabel.text = initLabelText
    }
}
