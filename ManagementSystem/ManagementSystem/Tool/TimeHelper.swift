//
//  TimeHelper.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import Foundation

class TimeHelper {
    static let shared = TimeHelper()
    
    func str2TimeModel(str: String) -> (time1: TimeModel, time2: TimeModel) {
        let timeArr = str.components(separatedBy: ["月", "日", ":", "到"])
        let time1 = TimeModel(month: timeArr[0], day: timeArr[1], hour: timeArr[2], minute: timeArr[3])
        let time2 = TimeModel(month: timeArr[0], day: timeArr[1], hour: timeArr[4], minute: timeArr[5])
        return (time1, time2)
    }
    
    func timeModel2Str(time1: TimeModel, time2: TimeModel) -> String {
        let month = time1.month
        let day = time1.day
        let timeArr = [month, "月", day, "日", time1.hour, ":", time1.minute, "到", time2.hour, ":", time2.minute]
        return timeArr.joined()
    }
    
    
}

struct TimeModel {
    var month: String
    var day: String
    var hour: String
    var minute: String
    
    init(month: String, day: String, hour: String, minute: String) {
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
    }
}
