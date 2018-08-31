//
//  CMTime.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/30.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit

extension CMTime : Codable{
    public enum CodingKeys: String, CodingKey {
        case value
        case timescale
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let value = try container.decode(Int64.self, forKey: CodingKeys.value)
        let timescale = try container.decode(Int32.self, forKey: CodingKeys.timescale)
        self.init(value: value, timescale: timescale)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.value, forKey: CMTime.CodingKeys.value)
        try container.encode(self.timescale, forKey: CMTime.CodingKeys.timescale)
    }
}
