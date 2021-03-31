//
//  LoginViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleStr: String = "您需要一个账号以启动APP的功能"
    
    lazy var loginBtn = { () -> UIButton in
        let tp = UIButton.generateButton(title: "登录")
        return tp
    } ()
    
    lazy var remindTitleView = { () -> UIView in
        let tp = UIView()
        let titleLabel = UILabel()
        titleLabel.text = self.titleStr
        tp.addSubview(titleLabel)
        return tp
    } ()
    
    lazy var accountField = { () -> UITextField in
        let tp = UITextField()
        tp.text = ""
        tp.textColor = UIColor.gray
        tp.placeholder = "请输入账号"
        tp.textAlignment = NSTextAlignment.left
        tp.borderStyle = UITextField.BorderStyle.roundedRect
        tp.clearButtonMode = UITextField.ViewMode.never
        return tp
    } ()
    
    lazy var passwordFiled = { () -> UITextField in
        let tp = UITextField()
        tp.text = ""
        tp.textColor = UIColor.gray
        tp.placeholder = "请输入密码"
        tp.textAlignment = NSTextAlignment.left
        tp.borderStyle = UITextField.BorderStyle.roundedRect
        tp.clearButtonMode = UITextField.ViewMode.never
        return tp
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        setupUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.popToRootViewController(animated: true)
//        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        self.view.addSubview(loginBtn)
        self.view.addSubview(remindTitleView)
        self.view.addSubview(accountField)
        self.view.addSubview(passwordFiled)
        
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        
        loginBtn.frame = CGRect(x: 120, y: 600, width: 200, height: 50)
//        remindTitleView.frame = CGRect(x: 20, y: 100, width: 200, height: 50)
        accountField.frame = CGRect(x: 20, y: 200, width: 200, height: 50)
        passwordFiled.frame = CGRect(x: 20, y: 300, width: 200, height: 50)
    }
    
    @objc func loginBtnClicked() {
        NSLog("LoginBtnClicked")
        NSLog("\(self.accountField.text!)")
        NSLog("\(self.passwordFiled.text!)")
        let vc = ApplyViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
