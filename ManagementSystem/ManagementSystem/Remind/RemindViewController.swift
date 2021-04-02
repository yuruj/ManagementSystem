//
//  RemindViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/24.
//

import UIKit

class RemindViewController: UIViewController {
    
    lazy var titleLabel = { () -> UILabel in
        let tp = UILabel()
        tp.text = "调班申请"
        return tp
    } ()
    
    lazy var collectionView = { () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 50)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
    
        let tp = UICollectionView(frame: CGRect(x: 0, y: 80, width: 200, height: 500), collectionViewLayout: layout)
        tp.collectionViewLayout = layout
        tp.register(RemindCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        tp.delegate = self
        tp.dataSource = self
        tp.isScrollEnabled = true
        tp.backgroundColor = nil
        return tp
    } ()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(collectionView)
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
    }
    
    
    
    
}


extension RemindViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RemindCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("yrj click collectionview \(indexPath.item)")
    }
}
