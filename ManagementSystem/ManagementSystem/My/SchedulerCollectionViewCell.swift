//
//  SchedulerCollectionViewCell.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import UIKit

enum weekday: String {
    case sun = "周日"
    case mon = "周一"
    case tue = "周二"
    case wed = "周三"
    case thu = "周四"
    case fri = "周五"
    case sat = "周六"
}

class SchedulerCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func getTimeLabelView(day: weekday, frame: CGRect) -> UIView {
        let tp = UIView()
        tp.frame = frame
        
        let label1 = UILabel()
        label1.text = day.rawValue + "上午"
        label1.backgroundColor = UIColor.clear
        let label2 = UILabel()
        label2.text = day.rawValue + "下午"
        label2.backgroundColor = UIColor.clear
        let label3 = UILabel()
        label3.text = day.rawValue + "晚上"
        label3.backgroundColor = UIColor.clear
        
        tp.addSubview(label1)
        tp.addSubview(label2)
        tp.addSubview(label3)
        
        return tp
    }
    
    private func getSchedulerUnitView() -> UIView {
        let tp = UIView()
        
        return tp
    }
}

struct SchedulerUnitDataModel {
    var name: String?
    var isUser: Bool?
    var isRemain: Bool?
}
