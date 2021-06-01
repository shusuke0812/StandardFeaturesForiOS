//
//  MainViewModel.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/20.
//

import UIKit

/*
 * memo:
 * ログインの状態などのイベントによって、セクション表示を変えることがあるので
 * viewModelにセクション表示ロジックを持たせてviewへ通知させる
 */

/// 機能一覧セクション
enum MainSectionType: String {
    /// どのアプリにもありそうなコア機能
    case core   = "主機能"
    /// 周辺機能
    case module = "周辺機能"
    /// アプリ連携機能
    case appLink = "アプリ連携"
    /// テスト
    case test   = "テスト"
    /// パフォーマンス計測
    case performance = "パフォーマンス"
    
    internal var rows: [MainRowType] {
        switch self {
        case .core:
            return [.login, .advertising, .contact, .terms]
        case .module:
            return [.onBording, .push, .carousel, .tapCopy, .accordion, .alert, .halfModal, .picker]
        case .appLink:
            return [.healthCare, .camera]
        case .test:
            return []
        case .performance:
            return [.measuring]
        }
    }
}

/// 機能一覧の行
enum MainRowType: String {
    case login          = "ログイン"
    case advertising    = "広告"
    case contact        = "お問い合わせ"
    case onBording      = "オンボーディング"
    case push           = "プッシュ通知"
    case terms          = "利用規約・プライバシーポリシー"
    case carousel       = "カルーセル表示"
    case tapCopy        = "テキスト長押しコピー"
    case accordion      = "アコーディオンメニュー"
    case alert          = "アラート"
    case halfModal      = "ハーフモーダル"
    case picker         = "ピッカービュー"
    case measuring      = "パフォーマンス計測"
    case healthCare     = "ヘルスケア"
    case camera         = "カメラ"
}

class MainViewModel: NSObject {
    // tableViewのセクション
    var sections: [MainSectionType] = []
    // セクションセット
    override init() {
        super.init()
        self.setSections()
    }
}
// MARK: - Setting Cell Method
extension MainViewModel {
    private func setSections() {
        // このメソッド内でセクションの設定を行う（ex. ログインしているときは〇〇）
        self.sections = [
            .core,
            .module,
            .appLink,
            .test,
            .performance
        ]
    }
}
extension MainViewModel {
    /// cell生成メソッド
    func makeMainModuleViewCell(tableView: UITableView, sectionType: MainSectionType, indexPath: IndexPath) -> MainModuleViewCell {
        let cell: MainModuleViewCell = tableView.dequeueReusableCell(withIdentifier: "MainModuleViewCell", for: indexPath) as! MainModuleViewCell
        let rowType: MainRowType = sectionType.rows[indexPath.row]
        cell.titleLabel.text = rowType.rawValue
        return cell
    }
}
// MARK: - UITableView DataSource Method
extension MainViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].rawValue
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType: MainSectionType = self.sections[indexPath.section]
        switch sectionType {
        case .core:
            return self.makeMainModuleViewCell(tableView: tableView, sectionType: sectionType, indexPath: indexPath)
        case .module:
            return self.makeMainModuleViewCell(tableView: tableView, sectionType: sectionType, indexPath: indexPath)
        case .appLink:
            return self.makeMainModuleViewCell(tableView: tableView, sectionType: sectionType, indexPath: indexPath)
        case .test:
            return self.makeMainModuleViewCell(tableView: tableView, sectionType: sectionType, indexPath: indexPath)
        case .performance:
            return self.makeMainModuleViewCell(tableView: tableView, sectionType: sectionType, indexPath: indexPath)
        }
    }
}
