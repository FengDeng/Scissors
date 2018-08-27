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
enum Resource {
    case asset(AVAsset)
    case image(PHAsset)
}

protocol Resourceable : class {
    func provide()->AVAsset
}








