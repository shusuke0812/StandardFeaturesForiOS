//
//  CarouselViewModel.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/12/19.
//

import UIKit

class CarouselViewModel: NSObject {
    /// カルーセル表示画像
    var carouselImages: [UIImage] = [UIImage(named: "sample01")!,
                                     UIImage(named: "sample02")!,
                                     UIImage(named: "sample03")!,
                                     UIImage(named: "sample04")!,
                                     UIImage(named: "sample05")!]
}
// MARK: - UICollectionView Delegate Method
extension CarouselViewModel: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.carouselImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
        cell.setUI(image: self.carouselImages[indexPath.row])
        return cell
    }
}
