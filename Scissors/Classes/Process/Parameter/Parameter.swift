//
//  Parameter.swift
//  Scissors
//
//  Created by 邓锋 on 2018/9/7.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit

class Parameter{
    var brightness = 0 //亮度
    var contrast = 0 //对比度
    var exposure = 0 //曝光
    var compensation = 0 //补偿
    var temperature = 0 //温度
    var saturation = 0 //饱和度
    var tone = 0 //色调
}

extension Parameter : Processable{
    func process(sourceImage: CIImage, renderSize: CGSize, at time: CMTime) -> CIImage {
        return sourceImage
    }
}
