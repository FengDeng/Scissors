//
//  ViewController.swift
//  Scissors
//
//  Created by 邓锋 on 2018/8/22.
//  Copyright © 2018年 fengdeng. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    var player : AVPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        /*
        let scissors = Scissors.init()
        
        scissors.mainResources = [Resource.init(filePath: Bundle.main.path(forResource: "Marvel Studios", ofType: "mp4")!),Resource.init(filePath: Bundle.main.path(forResource: "20180814152717897", ofType: "mp4")!)]
        scissors.mixResources = [Resource.init(filePath: Bundle.main.path(forResource: "火箭少女101 - 卡路里", ofType: "mp3")!),Resource.init(filePath: Bundle.main.path(forResource: "大张伟 - 我怎么这么好看", ofType: "mp3")!)]
        let compo = scissors.rebuildComposition()
        let videoComposition = AVMutableVideoComposition.init(asset: compo) { (request) in
            print("\(request.compositionTime.seconds)")
            let filter = CIFilter.init(name: "CIPhotoEffectTransfer")
            filter?.setValue(request.sourceImage, forKey: kCIInputImageKey)
            //filter?.setValue(2, forKey: "inputRadius")
            let image = filter?.outputImage
            request.finish(with: image!, context: nil)
        }
        */
        
        let asset = AVAsset.init(url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "20180814152717897", ofType: "mp4")!))
        let item = AVPlayerItem.init(asset: asset)
        /*
        let videoComposition = AVMutableVideoComposition.init(propertiesOf: asset)
        let parentLayer = CALayer.init()
        parentLayer.frame = CGRect.init(x: 0, y: 0, width: videoComposition.renderSize.width, height: videoComposition.renderSize.height)
        let videoLayer = CALayer.init()
        videoLayer.frame = CGRect.init(x: 0, y: 0, width: videoComposition.renderSize.width, height: videoComposition.renderSize.height)
        parentLayer.addSublayer(videoLayer)
        
        let customLayer = CALayer.init()
        customLayer.backgroundColor = UIColor.green.cgColor
        customLayer.frame = CGRect.init(x: 0, y: 0, width: 800, height: 400)
        parentLayer.addSublayer(customLayer)
        
        let tool = AVVideoCompositionCoreAnimationTool.init(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
        videoComposition.animationTool = tool
        */
        
        let syncLayer = AVSynchronizedLayer.init(playerItem: item)
        let customLayer = CALayer.init()
        customLayer.backgroundColor = UIColor.green.cgColor
        //customLayer.frame = CGRect.init(x: 0, y: 0, width: 800, height: 400)
        syncLayer.addSublayer(customLayer)
        
        
        
        
        self.view.layer.addSublayer(syncLayer)
        
        player = AVPlayer.init(playerItem: item)
        //item.videoComposition = videoComposition
        let layer = AVPlayerLayer.init(player: player)
        self.view.layer.addSublayer(layer)
        layer.frame = self.view.bounds
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

