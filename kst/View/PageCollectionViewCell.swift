//
//  PageCollectionViewCell.swift
//  kst
//
//  Created by Сергей Шевелев on 03.10.2022.
//

import UIKit
import Kingfisher

class PageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PageCollectionViewCell.self)
    
    @IBOutlet weak var sliderImageView: UIImageView!
    @IBOutlet weak var sliderTitleLabel: UILabel!
    
    func setup(_ rocket: Rocket) {
        sliderTitleLabel.text = rocket.name
        sliderImageView.kf.setImage(with: URL(string: rocket.flickr_images.first!))
    }
}
