//
//  WaterMark.swift
//  Scissors
//
//  Created by 邓锋 on 2018/9/6.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit

class WaterMark {
    
}

extension WaterMark : Processable{
    func process(sourceImage: CIImage, renderSize: CGSize, at time: CMTime) -> CIImage {
        return sourceImage
    }
}
