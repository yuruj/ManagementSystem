//
//  SchedulerViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import UIKit

class SchedulerViewController: UIViewController {
    
    lazy var collectionView = { () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.view.bounds.size
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let tp = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        tp.isPagingEnabled = true
        tp.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        tp.delegate = self
        tp.dataSource = self
        return tp
    } ()
    
    lazy var pageControl = { () -> UIPageControl in
        let tp = UIPageControl()
        tp.numberOfPages = 3
        tp.currentPage = 0
        tp.pageIndicatorTintColor = UIColor.gray
        tp.currentPageIndicatorTintColor = UIColor.black
        return tp
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        
    }
}

extension SchedulerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        let currentIndex = (offset + self.view.bounds.width / 2) / self.view.bounds.width
        pageControl.currentPage = Int(currentIndex)
    }
}
