//
//  CarouselBaseView.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/12/19.
//

import UIKit

class CarouselBaseView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var flowLayout: CarouselCollectionFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Initialized Method
extension CarouselBaseView {
    private func initUI() {
        self.flowLayout.estimatedItemSize = .zero
        self.collectionView.decelerationRate = .fast
        self.collectionView.register(UINib(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCollectionViewCell")
    }
}
