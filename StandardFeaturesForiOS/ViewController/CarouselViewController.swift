//
//  CarouselViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/28.
//

/*
 * このクラスで実装されている主な機能
 *   - 標準カルーセル表示（画像下にボタンのインジケータ有）
 *   - チラ見せカルーセル（左右の画像を少し見せるカルーセル）
 */

import UIKit

class CarouselViewController: UIViewController {
    /// BaseView
    private var baseView: CarouselBaseView { self.view as! CarouselBaseView }
    /// ViewModel
    private var viewModel: CarouselViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CarouselViewModel()
        self.setDelegateDataSource()
        self.setPageControl(currentPageNumber: 0)
    }
}
// MARK: - Private Method
extension CarouselViewController {
    private func setDelegateDataSource() {
        self.baseView.collectionView.delegate = self
        self.baseView.collectionView.dataSource = self.viewModel
    }
    private func setPageControl(currentPageNumber: Int) {
        self.baseView.setPageControl(currentPageNumber: currentPageNumber, numberOfPages: self.viewModel.carouselImages.count)
    }
}
// MARK: - UICollectionView Delegate FlowLayout Method
extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace: CGFloat = 0.0
        let cellWidth: CGFloat = self.baseView.bounds.width - horizontalSpace
        let cellHeight: CGFloat = self.baseView.collectionView.bounds.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
// MARK: - UICollectionView Delegate Method
extension CarouselViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let pageWidth = scrollView.bounds.size.width
        let pageNumber = Int(contentOffsetX / pageWidth)
        self.setPageControl(currentPageNumber: pageNumber)
    }
}
