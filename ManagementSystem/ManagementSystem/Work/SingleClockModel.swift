//
//  SingleClockModel.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import Foundation

enum AuditStatus: Int {
    case notYetReviewed = 0
    case oneStar = 1
    case twoStar = 2
    case threeStar = 3
}

struct SingleClockModel {
    var time: String?
    var audit: AuditStatus?
}
