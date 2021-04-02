//
//  RemindCollectionViewCell.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/31.
//

import UIKit

class RemindCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel = { () -> UILabel in
        let tp = UILabel()
        tp.text = "123456789"
        tp.font = UIFont.boldSystemFont(ofSize: 15)
        tp.textColor = UIColor.black
        tp.textAlignment = .center
        return tp
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        
//        NSLog("yrj cell width \(self.contentView.bounds.width)")
//        NSLog("yrj cell height \(self.contentView.bounds.height)")
        
        self.addSubview(titleLabel)
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: self.contentView.bounds.height)
        
        self.alpha = 0.5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
