//
//  Subtitle.swift
//  Scissors
//
//  Created by 邓锋 on 2018/9/6.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit

class SubtitleDesc {
    var text = ""//文本
    var color = UIColor.white //颜色
    var start : Double = 0 //开始显示时间
    var duration : Double = 0 //结束时间
}

class Subtitle{
    
    var subtitles = [SubtitleDesc]()
    
    init() {
        let t1 = SubtitleDesc.init()
        t1.text = "第一条字幕"
        t1.start = 1
        t1.duration = 3
        
        let t2 = SubtitleDesc.init()
        t2.text = "第二条条字幕"
        t2.start = 4
        t2.duration = 3
        
        let t3 = SubtitleDesc.init()
        t3.text = "第三条字幕"
        t3.start = 7
        t3.duration = 3
        
        let t4 = SubtitleDesc.init()
        t4.text = "第四条条字幕"
        t4.start = 10
        t4.duration = 3
        
        let t5 = SubtitleDesc.init()
        t5.text = "第五个条字幕"
        t5.start = 13
        t5.duration = 300
        
        subtitles = [t1,t2,t3,t4,t5]
    }
}

extension Subtitle : Processable{
    func process(sourceImage: CIImage, renderSize: CGSize, at time: CMTime) -> CIImage {
        //Get subtitle with time
        guard let subtitleAtt = self.getSubtitle(at: time) else{
            return sourceImage
        }
        //Generate Image with subtitle
        UIGraphicsBeginImageContextWithOptions(subtitleAtt.size(), false, 3)
        subtitleAtt.draw(at: CGPoint.zero)
        let renderImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = renderImage,let subtitleImage = CIImage.init(image: image) else {
            return sourceImage
        }
        
        //Modify SubtitleImage position
        let tansformFilter = CIFilter.init(name: "CIAffineTransform")!
        tansformFilter.setValue(subtitleImage, forKey: kCIInputImageKey)
        tansformFilter.setValue(CGAffineTransform.init(translationX: 10, y: 10), forKey: kCIInputTransformKey)
        
        //Composite SubtitleImage and VideoFrame
        let compositingFilter = CIFilter(name: "CISourceOverCompositing")!
        compositingFilter.setValue(sourceImage, forKey: kCIInputBackgroundImageKey)
        compositingFilter.setValue(tansformFilter.outputImage, forKey: kCIInputImageKey)
        if let out = compositingFilter.outputImage{
            return out
        }
        return sourceImage
    }
}

extension Subtitle{
    
    func getSubtitle(at time:CMTime)->NSAttributedString?{
        for subtitle in self.subtitles{
            let range = CMTimeRangeMake(CMTime.init(seconds: subtitle.start, preferredTimescale: 600), CMTime.init(seconds: subtitle.duration, preferredTimescale: 600))
            if range.containsTime(time){
                let str = NSAttributedString.init(string: subtitle.text, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 16),NSAttributedStringKey.strokeColor:UIColor.black,NSAttributedStringKey.strokeWidth:-1])
                return str
            }
        }
        return nil
    }
    
}
