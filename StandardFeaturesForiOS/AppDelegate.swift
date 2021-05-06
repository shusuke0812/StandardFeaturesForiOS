//
//  AppDelegate.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/20.
//

import UIKit
import IQKeyboardManagerSwift
import HealthKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // IQKeyboardManageライブラリの設定
        IQKeyboardManager.shared.enable = true
        // HealthKitに対応しているデバイスかを確認
        if HKHealthStore.isHealthDataAvailable() {
            print("DEBUG: ヘルスケアに`対応`しています")
        } else {
            print("DEBUG: ヘルスケアに`非対応`です")
        }
        // Firebase
        FirebaseApp.configure()
        
        return true
    }
}

