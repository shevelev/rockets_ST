//
//  PageViewController.swift
//  kst
//
//  Created by Сергей Шевелев on 03.10.2022.
//

import UIKit

class PageViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var rockets: [Rocket] = []
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.fetchRockets()
        NetworkManager.networkDelegate = self
        
        //rockets = [Rocket(name: "t1"), Rocket(name: "t2"), Rocket(name: "t3")]
        
        //collectionView.delegate = self
        //collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextBtnClicked(_ sender: UIButton) {
    }
    

}

// MARK: - delegate, DS
extension PageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rockets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.identifier, for: indexPath) as! PageCollectionViewCell
        
        cell.setup(rockets[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}

extension PageViewController: NetworkDelegate {
    func updateRocketsUI(_ rockets: [Rocket]) {
        pageControl.numberOfPages = rockets.count
        self.rockets = rockets
        collectionView.reloadData()
    }
    
    
}
