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
    
    
    var asset : AVURLAsset
    
    private init(asset:AVURLAsset) {
        self.asset = asset
    }
    
    convenience init(imagePath:String) {
        let asset = AVURLAsset.init(url: URL.init(fileURLWithPath: ""), options: [AVURLAssetPreferPreciseDurationAndTimingKey:true])
        self.init(asset: asset)
    }
    convenience init(filePath:String) {
        let asset = AVURLAsset.init(url: URL.init(fileURLWithPath: filePath), options: [AVURLAssetPreferPreciseDurationAndTimingKey:true])
        self.init(asset: asset)
    }
    
    required init(from decoder: Decoder) throws {
        //self.asset = decoder.container(keyedBy: .asset)
        self.asset = AVURLAsset.init(url: URL.init(fileURLWithPath: ""), options: [AVURLAssetPreferPreciseDurationAndTimingKey:true])
    }
    func encode(to encoder: Encoder) throws {
        
    }
    
}
