//
//  Processable.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/23.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit

protocol BaseProcessable{
    func process(image:CIImage?,at time:CMTime)->CIImage?
}

typealias Processable = BaseProcessable & Codable
