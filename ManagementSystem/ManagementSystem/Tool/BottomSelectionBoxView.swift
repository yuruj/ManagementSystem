//
//  BottomSelectionBoxView.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import UIKit

class BottomSelectionBoxView: UIView {
    
    // 屏幕参数 SB是SelectionBox
    let SBScreenH = UIScreen.main.bounds.size.height
    let SBScreenW = UIScreen.main.bounds.size.width
    
    var coverView: UIView?
    var modelArray: [String]?
    var selectBlock: ((Int) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showBottomSelectionBoxView() {
        coverView = UIView(frame: UIScreen.main.bounds)
        coverView?.backgroundColor = UIColor.gray
        self.superview?.addSubview(coverView!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(coverViewClick))
        coverView?.addGestureRecognizer(tap)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.superview?.bringSubviewToFront(self)
            self.frame = CGRect(x: 0, y: self.SBScreenH*0.55, width: self.SBScreenW, height: self.SBScreenH*0.45)
        })
    }
    
    func destroyBottomSelectionBoxView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.frame = CGRect(x: 0, y: self.SBScreenH, width: self.SBScreenW, height: self.SBScreenH*0.45)
        })
        // 移除弹框
        self.removeFromSuperview()
        // 移除遮盖
        self.coverView?.removeFromSuperview()
    }
    
    @objc func coverViewClick() {
        destroyBottomSelectionBoxView()
    }
    
    @objc func clickView() {
        NSLog("yrj 点击弹窗")
    }
}

class BottomSelectionBoxItemView: UIView {
    
}
