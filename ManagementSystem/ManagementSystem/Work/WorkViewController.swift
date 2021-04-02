//
//  WorkViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/24.
//

import UIKit

class WorkViewController: UIViewController {
    
    lazy var selectedPannel = { () -> UIView in
        let tp = UIView()
        let btn1 = UIButton()
        btn1.setTitle("打卡", for: .normal)
        let btn2 = UIButton()
        
        return tp
    } ()
    
    lazy var tableView = { () -> UITableView in
        let tp = UITableView()
        return tp
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func setupUI() {
        
    }
    
    
    
}

//extension WorkViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    
//}
