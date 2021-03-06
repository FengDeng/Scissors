//
//  Scissors.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/22.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit
class Scissors : Codable {
    
    //主时间轴
    var mainResources = [Resource]()

}


//所有的改变 最终只是修改avcomposition
extension Scissors{
    
    func rebuildComposition()->AVComposition{
        
        let _composition = AVMutableComposition.init()
        //一个视频轨道
        let videoTrack = _composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        //一个音频轨道
        let audioTrack = _composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        //把主轴里面的音视频轨道全部加入
        var posTime = kCMTimeZero
        for resources in self.mainResources{
            let asset = resources.asset.asset
            if let audioAssetTrack = asset.tracks(withMediaType: .audio).first{
                 try? audioTrack?.insertTimeRange(CMTimeRange.init(start: kCMTimeZero, duration: asset.duration), of: audioAssetTrack, at: posTime)
            }
            if let videoAssetTrack = asset.tracks(withMediaType: .video).first{
                try? videoTrack?.insertTimeRange(CMTimeRange.init(start: kCMTimeZero, duration: asset.duration), of: videoAssetTrack, at: posTime)
            }
            posTime = posTime + asset.duration
        }
        return _composition.copy() as! AVComposition
    }
    /*
    func rebuildVideoComposition()->AVVideoComposition{
        //设置滤镜效果
        let videoCompostion = AVVideoComposition.init(asset: composition) { (request) in
        }
        //设置视频过渡效果
        //videoCompostion.instructions =
        //设置有效帧率
        //videoCompostion.frameDuration
        //视频渲染尺寸
        //videoCompostion.renderSize
        //videoCompostion.renderScale
        return videoCompostion
    }
    func rebuildAudioMix(){
        
    }*/
}
