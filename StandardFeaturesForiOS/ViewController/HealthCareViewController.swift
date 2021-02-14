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
    
    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.updatedHealthCareData()
    }
    // MARK: - Action Method
    @IBAction func didTapHealthCareConnectionButton(_ sender: Any) {
        if !UserDefaults.standard.bool(forKey: Constant.UserDefaultsKey.healtCareAuthRequest) {
            UIAlertController.showAlertView(vc: self, title: "ヘルスケアアプリと\n連携しますか", message: nil, preferredStyle: .alert, okBtnLabel: "OK", cancelBtnLabel: "キャンセル") {
                self.setHealthCareAccess { status in
                    if status {
                        self.updatedHealthCareData()
                    }
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
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .bodyMass)!
        ]
        // 書き込めるデータの設定（体重）
        let writeData: Set<HKSampleType> = [
            HKSampleType.quantityType(forIdentifier: .bodyMass)!
        ]
        self.healthStore.requestAuthorization(toShare: writeData, read: readData) { status, error in
            if status {
                print("DEBUG: 認証済み")
                UserDefaults.standard.set(true, forKey: Constant.UserDefaultsKey.healtCareAuthRequest)
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
        self.readStepCount()
        self.readBodyMass()
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
    /// 歩数を読み込む
    private func readStepCount() {
        // 今日の日付
        let today = Date()
        // 昨日の日付
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)
        // 歩数設定
        let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
        let predicate = HKQuery.predicateForSamples(withStart: yesterday, end: today)
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum) { statisticsQuery, statistics, error in
            DispatchQueue.main.async {
                if let quantity = statistics?.sumQuantity() {
                    self.stepCountLabel.text = "\(Int(quantity.doubleValue(for: HKUnit.count())))" + " 歩"
                }
            }
        }
        self.healthStore.execute(query)
    }
    /// 体重を読み込む
    private func readBodyMass() {
        // 今日の日付
        let today = Date()
        // 昨日の日付
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)
        // 体重設定
        let type = HKSampleType.quantityType(forIdentifier: .bodyMass)!
        let predicate = HKQuery.predicateForSamples(withStart: yesterday, end: today)
        //let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let limit = 0
        let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: limit, sortDescriptors: nil) { sampleQuery, samples, error in
            guard let sample = samples?.first as? HKQuantitySample else { return }
            let bodyMass = sample.quantity.doubleValue(for: HKUnit.gram()) / 1000
            DispatchQueue.main.async {
                self.bodyMassLabel.text = "\(bodyMass) kg"
            }
        }
        self.healthStore.execute(query)
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
