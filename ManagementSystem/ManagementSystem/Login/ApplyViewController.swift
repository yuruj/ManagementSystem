//
//  ApplyViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/24.
//

import UIKit

class ApplyViewController: UIViewController {
    
    lazy var chooseView = { () -> UIView in
        let tp = UIView()
        tp.frame = CGRect(x: 20, y: 100, width: 300, height: 400)
        tp.backgroundColor = UIColor.white
        
        let str1 = UILabel()
        str1.text = "1、我是学生"
        str1.frame = CGRect(x: 30, y: 100, width: 200, height: 50)
        let btn1 = UIButton()
        
        let btn2 = UIButton()
        
        let str2 = UILabel()
        str2.text = "2、我是岗位负责人"
        str2.frame = CGRect(x: 30, y: 300, width: 200, height: 50)
        
        tp.addSubview(str1)
        tp.addSubview(str2)
        return tp
    } ()
    
    lazy var view2BackgroundView = { () -> UIView in
        let tp = UIView()
        return tp
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("进入申请页面")
    }
    
    private func setupUI() {
        
    }
    
    private func displayView1() {
        self.view.backgroundColor = UIColor.blue
    }
    
    private func displayView2() {
        self.view.backgroundColor = UIColor.white
    }
    
    
    
}
