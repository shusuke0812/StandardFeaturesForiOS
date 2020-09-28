//
//  ViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/20.
//

/*
 * このclassの役割はtableViewに各機能名をセクション表示させ、
 * セルに表示された機能名をタップして各機能の画面へ遷移させるもの
 */

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
        case .test:
            return 50
        case .performance:
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
            self.transitionCarouselPage()
        case .tapCopy:
            print("DEBUG： 長押しコピーセルがタップされた")
            self.transitionTapCopyPage()
        case .accordion:
            print("DEBUG： アコーディオンセルがタップされた")
            self.transitionAccordionMenuPage()
        case .alert:
            print("DEBUG： アラートセルがタップされた")
            self.transitionAlertPage()
        case .measuring:
            print("DEBUG： パフォーマンス計測がタップされた")
        }
    }
}

extension MainViewController {
    // TODO：各セル毎に同じような画面遷移の処理を書く必要があるので、一つにまとめられないか検討する
    /// カルーセル表示画面へ遷移
    private func transitionCarouselPage() {
        let s: UIStoryboard = UIStoryboard(name: "CarouselViewController", bundle: nil)
        let vc: CarouselViewController = s.instantiateInitialViewController() as! CarouselViewController
        self.present(vc, animated: true, completion: nil)
    }
    /// 長押しコピー画面へ遷移
    private func transitionTapCopyPage() {
        let s: UIStoryboard = UIStoryboard(name: "TapCopyViewController", bundle: nil)
        let vc: TapCopyViewController = s.instantiateInitialViewController() as! TapCopyViewController
        self.present(vc, animated: true, completion: nil)
    }
    /// アコーディオン画面へ遷移
    private func transitionAccordionMenuPage() {
        let s: UIStoryboard = UIStoryboard(name: "AccordionMenuViewController", bundle: nil)
        let vc: AccordionMenuViewController = s.instantiateInitialViewController() as! AccordionMenuViewController
        self.present(vc, animated: true, completion: nil)
    }
    /// アラート表示画面へ遷移
    private func transitionAlertPage() {
        let s: UIStoryboard = UIStoryboard(name: "AlertViewController", bundle: nil)
        let vc: AlertViewController = s.instantiateInitialViewController() as! AlertViewController
        self.present(vc, animated: true, completion: nil)
    }
}
