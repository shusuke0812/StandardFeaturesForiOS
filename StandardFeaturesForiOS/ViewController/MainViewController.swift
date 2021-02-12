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
// MARK: - Private Method
extension MainViewController {
    private func setBaseView() {
        self.baseView.tableView.tableFooterView = UIView()
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
    }
}
extension MainViewController {
    // TODO：各セル毎に同じような画面遷移の処理を書く必要があるので、一つにまとめられないか検討する
    /// カルーセル表示画面へ遷移
    private func transitionCarouselPage() {
        let vc = Storyboard.CarouselViewController.instantiate(CarouselViewController.self, inBundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    /// 長押しコピー画面へ遷移
    private func transitionTapCopyPage() {
        let vc = Storyboard.TapCopyViewController.instantiate(TapCopyViewController.self, inBundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    /// アコーディオン画面へ遷移
    private func transitionAccordionMenuPage() {
        let vc = Storyboard.AccordingMenuViewController.instantiate(AlertViewController.self, inBundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    /// アラート表示画面へ遷移
    private func transitionAlertPage() {
        let vc = Storyboard.AlertViewController.instantiate(AlertViewController.self, inBundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    /// ハーフモーダルで画面を表示
    private func transitionHalfModal() {
        let vc = Storyboard.HalfModalViewController.instantiate(HalfModalViewController.self, inBundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    /// パフォーマンス計測画面へ遷移
    private func transitionPerformanceMeasuringPage() {
        let vc = Storyboard.PerformanceMeasuringViewController.instantiate(PerformanceMeasuringViewController.self, inBundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
// MARK: - UITableView Delegate Method
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType: MainSectionType = self.viewModel.sections[indexPath.section]
        switch sectionType {
        case .core:
            return 50
        case .module:
            return 50
        case .appLink:
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
        case .halfModal:
            print("DEBUG: ハーフモーダルがタップされた")
            self.transitionHalfModal()
        case .measuring:
            print("DEBUG： パフォーマンス計測がタップされた")
            self.transitionPerformanceMeasuringPage()
        case .healthCare:
            print("DEBUG： ヘルスケアアプリがタップされた")
        }
        // セルの選択状態を解除
        self.baseView.tableView.deselectRow(at: indexPath, animated: true)
    }
}
