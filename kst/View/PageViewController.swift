//
//  PageViewController.swift
//  kst
//
//  Created by Сергей Шевелев on 03.10.2022.
//

import UIKit

class PageViewController: UIPageViewController {


    var rockets: [Rocket] = []
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NetworkManager.fetchRockets()
    }
}

