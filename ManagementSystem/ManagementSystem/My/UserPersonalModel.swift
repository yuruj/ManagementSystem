//
//  UserPersonalModel.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import Foundation

enum UserPosition: Int {
    case assistantManager = 0
    case teamLeader = 1
    case jobHolder = 2
}

struct UserPersonalModel {
    var name: String = "毛茜茜"
    var headPortrait: String = ""
    var position: UserPosition = UserPosition.assistantManager
    var job: String = ""
    var studentNumber: String = "U201910588"
    var bankCardNumber: String = "63131312323424142442"
    var phoneNumber: String = "18051617666"
    
    init() {
        
    }
    
    // 修改用户的数据
    mutating func changeName(name: String) {
        self.name = name
    }
    
    mutating func changeHeadPortrait(headPortrait: String) {
        self.headPortrait = headPortrait
    }
    
    mutating func changePosition(position: UserPosition) {
        self.position = position
    }
    
    mutating func changeJob(job: String) {
        self.job = job
    }
    
    mutating func changeStudentNumber(studentNumber: String) {
        self.studentNumber = studentNumber
    }
    
    mutating func changeBankCardNumber(bankCardNumber: String) {
        self.bankCardNumber = bankCardNumber
    }
    
    mutating func changePhoneNumber(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
}
