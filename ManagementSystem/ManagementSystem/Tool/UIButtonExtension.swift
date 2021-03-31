//
//  UIButtonExtension.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/24.
//

import UIKit

extension UIButton {
    
    static func generateButton(title: String, titleColor: UIColor = UIColor.blue, backgroundColor: UIColor = UIColor.white, borderColor: CGColor = UIColor.blue.cgColor) -> UIButton {
        let tp = UIButton()
        tp.setTitle(title, for: .normal)
        tp.setTitleColor(titleColor, for: .normal)
        tp.backgroundColor = backgroundColor
        tp.layer.borderColor = borderColor
        tp.layer.borderWidth = 2
        tp.layer.cornerRadius = 20
        return tp
    }
    
}
