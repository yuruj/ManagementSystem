//
//  ViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/16.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let bar = UITabBar()
        self.setValue(bar, forKey: "tabBar")
        
        addWorkVC()
        addRemindVC()
        addMyVC()
        
        self.selectedIndex = 0
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addLoginVC()
    }
    
    private func addLoginVC() {
//        if (!UserDefaults.standard.bool(forKey: "firstLaunch")) {
//            UserDefaults.standard.set(true, forKey: "firstLaunch")
        if true {
            let vc = LoginViewController()
            vc.hidesBottomBarWhenPushed = true
            let workvc = self.children[0] as! UINavigationController
            workvc.pushViewController(vc, animated: false)
            NSLog("第一次登录 进入登录页面")
        } else {
            NSLog("已有账号 直接进入主页面")
        }
    }
    
    private func addWorkVC() {
        let vc = WorkViewController()
        vc.view.backgroundColor = UIColor.white
        
        let cvc = UINavigationController(rootViewController: vc)
        cvc.navigationBar.barTintColor = nil
        cvc.navigationBar.isHidden = true
        cvc.navigationBar.setValue(true, forKey: "hidesShadow")
        cvc.navigationItem.backBarButtonItem = nil
        cvc.tabBarItem.title = "工作"
        cvc.tabBarItem.tag = 0
        
        self.addChild(cvc)
    }
    
    private func addRemindVC() {
        let vc = RemindViewController()
        vc.view.backgroundColor = UIColor.white
        
        let cvc = UINavigationController(rootViewController: vc)
        cvc.navigationBar.barTintColor = nil
        cvc.navigationBar.isHidden = true
        cvc.navigationBar.setValue(true, forKey: "hidesShadow")
        cvc.navigationItem.backBarButtonItem = nil
        cvc.tabBarItem.title = "通知"
        cvc.tabBarItem.tag = 0
        
        self.addChild(cvc)
    }
    
    private func addMyVC() {
        let vc = MyViewController()
        vc.view.backgroundColor = UIColor.white
        
        let cvc = UINavigationController(rootViewController: vc)
        cvc.navigationBar.barTintColor = nil
        cvc.navigationBar.isHidden = true
        cvc.navigationBar.setValue(true, forKey: "hidesShadow")
        cvc.navigationItem.backBarButtonItem = nil
        cvc.tabBarItem.title = "我的"
        cvc.tabBarItem.tag = 0
        
        self.addChild(cvc)
    }
    

}
