//
//  MyViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/24.
//

import UIKit

class MyViewController: UIViewController {
    
    lazy var informationView = { () -> UIView in
        let tp = UIView()
        tp.backgroundColor = UIColor.white
        tp.layer.borderWidth = 1
        tp.layer.borderColor = UIColor.black.cgColor
        tp.layer.cornerRadius = 10
        
        let nameLabel = UILabel()
        nameLabel.text = String(format: "姓名：  %@", "毛嘻嘻")
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .left
        let stationLabel = UILabel()
        stationLabel.text = String(format: "岗位:   %@", "公寓岗-4组")
        stationLabel.textColor = UIColor.black
        stationLabel.textAlignment = .left
        
        let detailsBtn = UIButton()
        detailsBtn.setTitle(">", for: .normal)
        detailsBtn.setTitleColor(UIColor.blue, for: .normal)
        detailsBtn.addTarget(self, action: #selector(self.informationDetailsBtnClicked), for: .touchUpInside)
        
        nameLabel.frame = CGRect(x: 0, y: 20, width: 300, height: 20)
        stationLabel.frame = CGRect(x: 0, y: 60, width: 300, height: 20)
        detailsBtn.frame = CGRect(x: 250, y: 25, width: 50, height: 50)
        tp.addSubview(nameLabel)
        tp.addSubview(stationLabel)
        tp.addSubview(detailsBtn)
        
        return tp
    } ()
    
    // 排班表
    lazy var btn1 = { () -> UIButton in
        let tp = UIButton()
        tp.setTitle("排班表", for: .normal)
        tp.setTitleColor(UIColor.black, for: .normal)
        return tp
    } ()
    
    // 组织架构
    lazy var btn2 = { () -> UIButton in
        let tp = UIButton()
        tp.setTitle("组织架构", for: .normal)
        tp.setTitleColor(UIColor.black, for: .normal)
        return tp
    } ()
    
    // 值班历史
    lazy var btn3 = { () -> UIButton in
        let tp = UIButton()
        tp.setTitle("值班历史", for: .normal)
        tp.setTitleColor(UIColor.black, for: .normal)
        return tp
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        btn1.frame = CGRect(x: 50, y: 300, width: 200, height: 50)
        btn2.frame = CGRect(x: 50, y: 400, width: 200, height: 50)
        btn3.frame = CGRect(x: 50, y: 500, width: 200, height: 50)
        informationView.frame = CGRect(x: 70, y: 100, width: 300, height: 100)
        
        btn1.addTarget(self, action: #selector(btn1Clicked), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(btn2Clicked), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(btn3Clicked), for: .touchUpInside)
        
        self.view.addSubview(btn1)
        self.view.addSubview(btn2)
        self.view.addSubview(btn3)
        self.view.addSubview(informationView)
    }
    
    @objc func informationDetailsBtnClicked() {
        NSLog("yrj 查看个人资料详情")
        let vc = PersonalDataViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func btn1Clicked() {
        NSLog("yrj 进入排表表页面")
    }
    
    @objc func btn2Clicked() {
        NSLog("yrj 进入组织架构页面")
    }
    
    @objc func btn3Clicked() {
        NSLog("yrj 进入值班历史页面")
    }
    
    
}
