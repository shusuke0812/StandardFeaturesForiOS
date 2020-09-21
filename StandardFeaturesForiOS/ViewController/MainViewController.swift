//
//  ViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/20.
//

import UIKit

class MainViewController: UIViewController {
    /// BaseView
    private var baseView: MainBaseView { return self.view as! MainBaseView}
    /// ViewModel
    private var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModel()
        self.setBaseView()
    }
}

extension MainViewController {
    private func setBaseView() {
        self.baseView.tableView.tableFooterView = UIView()
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType: MainSectionType = self.viewModel.sections[indexPath.section]
        switch sectionType {
        case .core:
            return 50
        case .module:
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionRowType: MainRowType = self.viewModel.sections[indexPath.section].rows[indexPath.row]
        switch sectionRowType {
        case .login:
            print("DEBUG： ログインセルがタップされた")
        case .advertising:
            print("DEBUG： 広告セルがタップされた")
        case .contact:
            print("DEBUG： お問い合わせセルがタップされた")
        case .onBording:
            print("DEBUG： オンボーディングセルがタップされた")
        case .push:
            print("DEBUG： プッシュ通知セルがタップされた")
        case .terms:
            print("DEBUG： 規約セルがタップされた")
        case .carousel:
            print("DEBUG： カルーセルセルがタップされた")
        case .tapCopy:
            print("DEBUG： 長押しコピーセルがタップされた")
        }
    }
}
