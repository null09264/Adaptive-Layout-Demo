//
//  NotificationService.swift
//  Demo
//
//  Created by Wang Jinghan on 20/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class NotificationService {
    struct KeyboardParam {
        let height: CGFloat
        let duration: TimeInterval
        let option: UIView.AnimationOptions
    }
    
    class func keyboardParams(from notification: Notification) -> KeyboardParam? {
        guard
            let userInfo = notification.userInfo,
            let duration = userInfo[UIWindow.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let curve = userInfo[UIWindow.keyboardAnimationCurveUserInfoKey] as? UInt
        else { return nil }
        
        let height: CGFloat
        
        switch notification.name {
        case UIWindow.keyboardWillChangeFrameNotification,
             UIWindow.keyboardWillShowNotification:
            
            guard let rect = userInfo[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else { return nil }
            height = rect.height
        
        case UIWindow.keyboardWillHideNotification:
            height = 0
            
        default:
            return nil
        }
        
        return KeyboardParam(height: height, duration: duration, option: .init(rawValue: curve))
    }
}
