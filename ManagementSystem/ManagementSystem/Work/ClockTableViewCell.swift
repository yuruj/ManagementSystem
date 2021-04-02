//
//  ClockTableViewCell.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        setupUI()
    }
    
    func setupUI() {
        let textLabel = UILabel()
        textLabel.text = "123131231"
        textLabel.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: self.contentView.bounds.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
