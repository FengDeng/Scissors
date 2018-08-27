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
    var mainAssets = [AVAsset]()
    
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
        
    }
}


//所有的改变 最终只是修改avcomposition
extension Scissors{
    func rebuildComposition(){
        //取出主轴的音视频
        let composition = AVMutableComposition.init()
        let videoTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        let audioTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        for asset in self.mainAssets{
            if let audioAssetTrack = asset.tracks(withMediaType: .audio).first{
                audioTrack?.scaleTimeRange(<#T##timeRange: CMTimeRange##CMTimeRange#>, toDuration: <#T##CMTime#>)
            }
        }
        AVVideoCompositionCoreAnimationTool
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
