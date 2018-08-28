//
//  Configuration.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/28.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import UIKit
import AVKit

/// config video and store
class VideoConfiguration : Codable {
    
    //变速
    var speed : Double = 0
    
    //裁剪
    var clipStart : Double = 0
    var clipDuration : Double = 0
    
    //转场动画
    var transform = 1
}

/// config audio and store
class AudioConfiguration : Codable{
    
}
