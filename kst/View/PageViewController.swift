//
//  PageViewController.swift
//  kst
//
//  Created by Сергей Шевелев on 03.10.2022.
//

import UIKit

class PageViewController: UIPageViewController {


    var rockets: [Rocket] = [] {
        didSet {
            updateRockets()
        }
    }
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        NetworkManager.networkDelegate = self
        
        addPageControl()
        
        NetworkManager.fetchRockets()
    }
    
    func updateRockets() {
        if let vc = self.direction(0) {
            self.setViewControllers([vc], direction: .forward, animated: false)
            self.pageControl.numberOfPages = rockets.count
        }
    }
    
    func direction(_ index: Int) -> DetailRocketPageVC? {
        if index < 0 {
            return nil
        }
        if index >= rockets.count {
            return nil
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailRocketPage") as! DetailRocketPageVC
        vc.rocket = rockets[index]
        vc.index = index
        return vc
    }
    
    func addPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY-75, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = rockets.count
        pageControl.currentPage = 0
        pageControl.tintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .green
        self.view.addSubview(pageControl)
    }
}

// MARK: - DS
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        let index = ((viewController as? DetailRocketPageVC)?.index ?? 0) - 1
        
        return self.direction(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = ((viewController as? DetailRocketPageVC)?.index ?? 0) + 1
        
        return self.direction(index)
    }
}

// MARK: - Delegate
extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let index = (pageViewController.viewControllers![0] as? DetailRocketPageVC)?.index ?? 0
        self.pageControl.currentPage = index
    }
}

// MARK: - NetworkApi
extension PageViewController: NetworkDelegate {
    func updateRocketsUI(_ rockets: [Rocket]) {
        self.rockets = rockets
    }
}
