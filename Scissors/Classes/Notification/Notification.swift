//
//  Notification.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/28.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation


enum ScissorsNotification : String{
    //调速
    case speed
    //裁剪
    case clip
    
    //源更新了
    case compositionUpdated
    
    var notificationName : Notification.Name{
        return Notification.Name.init("ScissorsNotification\(self.rawValue)")
    }
}

extension NotificationCenter{
    func post(scissorsNotification aName: ScissorsNotification, object anObject: Any?){
        self.post(name: aName.notificationName, object: anObject)
    }
}
