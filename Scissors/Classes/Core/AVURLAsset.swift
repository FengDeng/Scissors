//
//  SOURLAsset.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/30.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit
public class SOURLAsset : Codable{
    public let asset : AVURLAsset
    
    init(asset:AVURLAsset) {
        self.asset = asset
    }
    public enum CodingKeys: String, CodingKey {
        case url
    }
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let url = try container.decode(String.self, forKey: CodingKeys.url)
        self.asset = AVURLAsset.init(url: URL.init(fileURLWithPath: url))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.asset.url.absoluteString, forKey: SOURLAsset.CodingKeys.url)
    }
}
