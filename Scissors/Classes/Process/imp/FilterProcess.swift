//
//  FilterProcess.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/23.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import CoreImage
import AVKit
class FilterProcess {
    var filter : CIFilter
    init(filter:CIFilter) {
        self.filter = filter
        //CIKaleidoscope万花筒
        let range = CMTimeRange.init()
    }
}

extension FilterProcess : Processable{
    func process(image: CIImage?) -> CIImage? {
        self.filter.setValue(image, forKey: kCIInputImageKey)
        return self.filter.outputImage
    }
}
