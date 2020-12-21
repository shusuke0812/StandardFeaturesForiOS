//
//  CarouselBaseView.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/12/19.
//

import UIKit

class CarouselBaseView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: CarouselCollectionFlowLayout!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initCollectionView()
        self.initPageControl()
    }
}
// MARK: - Initialized Method
extension CarouselBaseView {
    private func initCollectionView() {
        self.flowLayout.estimatedItemSize = .zero
        self.collectionView.decelerationRate = .fast
        self.collectionView.register(UINib(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCollectionViewCell")
    }
    private func initPageControl() {
        self.pageControl.backgroundColor = .lightGray
        self.pageControl.pageIndicatorTintColor = .white
        self.pageControl.currentPageIndicatorTintColor = .systemBlue
    }
}
// MARK: - Setting UI Method
extension CarouselBaseView {
    func setPageControl(currentPageNumber: Int, numberOfPages: Int) {
        self.pageControl.currentPage = currentPageNumber
        self.pageControl.numberOfPages = numberOfPages
    }
}
