//
//  viewViewController.swift
//  kst
//
//  Created by Сергей Шевелев on 06.10.2022.
//

import UIKit
import Kingfisher

class DetailRocketPageVC: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var settingsIcon: UILabel!
    
    var rocket: Rocket?
    var index: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.kf.setImage(with: URL(string: (rocket?.flickr_images.randomElement())!))
        
        rocketName.text = rocket?.name
        
        
    }
}
