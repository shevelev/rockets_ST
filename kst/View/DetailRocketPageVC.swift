//
//  viewViewController.swift
//  kst
//
//  Created by Сергей Шевелев on 06.10.2022.
//

import UIKit

class DetailRocketPageVC: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    
    var rocket: Rocket?
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl.text = rocket?.name
        
        // Do any additional setup after loading the view.
    }
}
