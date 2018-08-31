//
//  Resource.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/28.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit

class Resource: Resourceable {
    
    var asset : SOURLAsset
    var isImage = false
    
    private init(asset:SOURLAsset) {
        self.asset = asset
    }
    
    convenience init(imagePath:String) {
        let asset = AVURLAsset.init(url: URL.init(fileURLWithPath: ""), options: [AVURLAssetPreferPreciseDurationAndTimingKey:true])
        self.init(asset: SOURLAsset.init(asset: asset))
        self.isImage = true
    }
    convenience init(filePath:String) {
        let asset = AVURLAsset.init(url: URL.init(fileURLWithPath: filePath), options: [AVURLAssetPreferPreciseDurationAndTimingKey:true])
        self.init(asset: SOURLAsset.init(asset: asset))
    }
    
}
