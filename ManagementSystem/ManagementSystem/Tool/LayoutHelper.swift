//
//  LayoutHelper.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/4.
//

import UIKit

// 适用于view比screen小
class LayoutHelper {
    static let shared = LayoutHelper()
    
    func theXAtCenter(screenSize: CGSize, viewSize: CGSize) -> CGFloat {
        let screenWdith = screenSize.width
        let viewWidth = viewSize.width
        return (screenWdith - viewWidth) / 2
    }
    
    func theYAtCenter(scrrenSize: CGSize, viewSize: CGSize) -> CGFloat {
        let screenHeight = scrrenSize.height
        let viewHeight = viewSize.height
        return (screenHeight - viewHeight) / 2
    }
}
