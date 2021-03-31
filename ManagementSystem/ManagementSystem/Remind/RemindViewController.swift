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
        layout.itemSize = self.view.bounds.size
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
    
        let tp = UICollectionView()
        tp.collectionViewLayout = layout
        tp.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        tp.delegate = self
        tp.dataSource = self
        return tp
    } ()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(titleLabel)
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
    }
    
    
    
    
}


extension RemindViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
