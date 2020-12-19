//
//  CarouselCollectionViewCell.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/28.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: -  Setting UI Method
extension CarouselCollectionViewCell {
    private func initUI() {
        self.imageView.backgroundColor = .lightGray
    }
    func setUI(image: UIImage)  {
        self.imageView.image = image
    }
}
