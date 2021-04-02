//
//  RemindNotificationModel.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/2.
//

import Foundation

protocol RemindNotificationProtocol {
    
}

enum RemindNotificationType: Int {
    case shiftRequest = 0
    case regularMeetingNotice = 1
}

struct RemindNotificationModel {
    var kind: RemindNotificationType
//    var data: RemindNotificationProtocol

    init(kind: RemindNotificationType) {
        self.kind = kind
    }
    
}

struct ShiftRequestModel {
    
}

struct regularMeetingNoticeModel {
    
}
