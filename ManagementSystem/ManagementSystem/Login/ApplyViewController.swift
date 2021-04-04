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
        let tpX = LayoutHelper.shared.theXAtCenter(screenSize: UIScreen.main.bounds.size, viewSize: CGSize(width: 300, height: 400))
        let tpY = LayoutHelper.shared.theYAtCenter(scrrenSize: UIScreen.main.bounds.size, viewSize: CGSize(width: 300, height: 400))
        tp.frame = CGRect(x: tpX, y: tpY, width: 300, height: 400)
        tp.backgroundColor = UIColor.white
        tp.layer.cornerRadius = 5
        
        let x = LayoutHelper.shared.theXAtCenter(screenSize: tp.bounds.size, viewSize: CGSize(width: 200, height: 50))
        
        let str1 = UILabel()
        str1.text = "1、我是学生"
        str1.frame = CGRect(x: x, y: 50, width: 200, height: 50)
        str1.textAlignment = .left
        let btn1 = UIButton.generateButton(title: "申请报名")
        btn1.frame = CGRect(x: x, y: 100, width: 200, height: 50)
        btn1.addTarget(self, action: #selector(applyBtnClicked), for: .touchUpInside)
        
        let str2 = UILabel()
        str2.text = "2、我是岗位负责人"
        str2.frame = CGRect(x: x, y: 180, width: 200, height: 50)
        let btn2 = UIButton.generateButton(title: "创建岗位")
        btn2.frame = CGRect(x: x, y: 230, width: 200, height: 50)
        btn2.addTarget(self, action: #selector(createBtnClicked), for: .touchUpInside)
        
        tp.addSubview(str1)
        tp.addSubview(str2)
        tp.addSubview(btn1)
        tp.addSubview(btn2)
        return tp
    } ()
    
    lazy var writeView = { () -> UIView in
        let tp = UIView()
        return tp
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("进入申请页面")
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(chooseView)
        self.view.addSubview(writeView)
        
        displayView1()
    }
    
    private func displayView1() {
        chooseView.isHidden = false
        writeView.isHidden = true
        self.view.backgroundColor = UIColor.blue
    }
    
    private func displayView2() {
        chooseView.isHidden = true
        writeView.isHidden = false
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func applyBtnClicked() {
        NSLog("申请报名按钮点击")
        displayView2()
    }
    
    @objc func createBtnClicked() {
        NSLog("创建岗位按钮点击")
        displayView2()
    }
    
    @objc func submitBtnClicked() {
        NSLog("提交报名表按钮点击")
        
    }
    
}
