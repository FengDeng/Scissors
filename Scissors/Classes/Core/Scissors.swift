//
//  Scissors.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/22.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import Foundation
import AVKit
class Scissors {
    
    //定时器 渲染
    fileprivate lazy var displayLink : CADisplayLink = {
        let link = CADisplayLink.init(target: self, selector: #selector(handleDisplayLink))
        link.isPaused = true
        link.add(to: .main, forMode: .commonModes)
        return link
    }()
    
    //当前预览的时间
    fileprivate var previewTime = kCMTimeZero
    
    //主时间轴
    var mainResources = [Resource]()
    
    var _composition = AVMutableComposition.init()
    
    
    //效果
    var processs = [Processable]()
    
}

extension Scissors{
    @objc func handleDisplayLink(){
        
    }
}


extension Scissors{
    func play(){}
    func pause(){}
    func preview(at time:CMTime){
        let p = AVPlayer.init()
        
    }
}


//所有的改变 最终只是修改avcomposition
extension Scissors{
    func rebuildComposition(){
        
        self._composition = AVMutableComposition.init()
        //一个视频轨道
        let videoTrack = _composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        //一个音频轨道
        let audioTrack = _composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        //把主轴里面的音视频轨道全部加入
        var posTime = kCMTimeZero
        for resources in self.mainResources{
            let asset = resources.asset
            if let audioAssetTrack = asset.tracks(withMediaType: .audio).first{
                 try? audioTrack?.insertTimeRange(CMTimeRange.init(start: kCMTimeZero, duration: asset.duration), of: audioAssetTrack, at: posTime)
            }
            if let videoAssetTrack = asset.tracks(withMediaType: .video).first{
                try? videoTrack?.insertTimeRange(CMTimeRange.init(start: kCMTimeZero, duration: asset.duration), of: videoAssetTrack, at: posTime)
            }
            posTime = posTime + asset.duration
        }
    }
    func rebuildVideoComposition(){
        //设置滤镜效果
        let composition = AVComposition.init()
        let videoCompostion = AVVideoComposition.init(asset: composition) { (request) in
            let sourceImage = request.sourceImage
            request.compositionTime
        }
        //设置视频过渡效果
        //videoCompostion.instructions =
        //设置有效帧率
        //videoCompostion.frameDuration
        //视频渲染尺寸
        //videoCompostion.renderSize
        //videoCompostion.renderScale
    }
    func rebuildAudioMix(){
        
    }
}
