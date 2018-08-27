//
//  Resourceable+Property.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/23.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit
//
fileprivate var ResourceStartTime = "ResourceStartTime"
fileprivate var ResourceEndTime = "ResourceEndTime"

extension Resourceable{
    
    //开始时间
    var startTime : CMTime{
        get{
            return (objc_getAssociatedObject(self, &ResourceStartTime) as? CMTime) ?? kCMTimeZero
        }
        set{
            objc_setAssociatedObject(self, &ResourceStartTime, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var endTime : CMTime{
        get{
            return (objc_getAssociatedObject(self, &ResourceEndTime) as? CMTime) ?? kCMTimeZero
        }
        set{
            objc_setAssociatedObject(self, &ResourceEndTime, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
