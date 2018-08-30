//
//  SOTime.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/30.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit

public func SOTimeMake(value:Int64,timescale:Int32)->SOTime{
    let time = CMTimeMake(value, timescale)
    CMTimeRange.init()
    return SOTime.init(time: time)
}

public struct SOTime : Codable{
    public let time : CMTime
    
    init(time:CMTime) {
        self.time = time
    }
    public enum CodingKeys: String, CodingKey {
        case value
        case timescale
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let value = try container.decode(Int64.self, forKey: CodingKeys.value)
        let timescale = try container.decode(Int32.self, forKey: CodingKeys.timescale)
        self.time = CMTimeMake(value, timescale)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.time.value, forKey: SOTime.CodingKeys.value)
        try container.encode(self.time.timescale, forKey: SOTime.CodingKeys.timescale)
    }
}
