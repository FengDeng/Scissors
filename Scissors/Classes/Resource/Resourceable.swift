//
//  Resourceable.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/22.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit
import Photos

protocol ResourceDelegate : class {
    
}

class Resource {
    
    //资源的原始长度
    let originDuration : CMTime
    //资源的裁剪range
    var clipRange : CMTimeRange
    //资源的缩放 默认不进行缩放
    var scale : Int = 1
    //资源的长度
//    var duration : CMTime{
//
//    }
    
    var asset : AVAsset
    init(filePath:String) {
        
        self.asset = AVAsset.init(url: URL.init(fileURLWithPath: filePath))
        self.originDuration = asset.duration
        self.clipRange = CMTimeRange.init(start: kCMTimeZero, duration: asset.duration)
    }
    
    
}








