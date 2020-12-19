//
//  CarouselBaseView.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/12/19.
//

import UIKit

class CarouselBaseView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Initialized Method
extension CarouselBaseView {
    private func initUI() {
        self.collectionView.register(UINib(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCollectionViewCell")
    }
}
