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
        guard let subtitleImage = self.getSubtitle(at: time) else{
            return sourceImage
        }
        //移动字幕位置的filter
        let tansformFilter = CIFilter.init(name: "CIAffineTransform")!
        tansformFilter.setValue(subtitleImage, forKey: kCIInputImageKey)
        tansformFilter.setValue(CGAffineTransform.init(translationX: 10, y: 10), forKey: kCIInputTransformKey)
        
        //把字幕和视频帧合并的filter
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
    
    func getSubtitle(at time:CMTime)->CIImage?{
        for subtitle in self.subtitles{
            let range = CMTimeRangeMake(CMTime.init(seconds: subtitle.start, preferredTimescale: 600), CMTime.init(seconds: subtitle.duration, preferredTimescale: 600))
            if range.containsTime(time){
                //添加描边 白字 黑边
                let str = NSAttributedString.init(string: subtitle.text, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 16),NSAttributedStringKey.strokeColor:UIColor.black,NSAttributedStringKey.strokeWidth:-1])
                UIGraphicsBeginImageContextWithOptions(str.size(), false, 3)
                str.draw(at: CGPoint.zero)
                let image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                if let image = image{
                    return CIImage.init(image: image)
                }else{
                    return nil
                }
            }
        }
        return nil
    }
    
}
