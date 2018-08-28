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
        let scissors = Scissors.init()
        
        scissors.mainResources = [Resource.init(filePath: Bundle.main.path(forResource: "Marvel Studios", ofType: "mp4")!),Resource.init(filePath: Bundle.main.path(forResource: "20180814152717897", ofType: "mp4")!)]
        let compo = scissors.rebuildComposition()
        let a = AVMutableVideoComposition.init(asset: compo) { (request) in
            print("\(request.compositionTime.seconds)")
            let filter = CIFilter.init(name: "CIPhotoEffectTransfer")
            filter?.setValue(request.sourceImage, forKey: kCIInputImageKey)
            //filter?.setValue(2, forKey: "inputRadius")
            let image = filter?.outputImage
            request.finish(with: image!, context: nil)
        }
        let item = AVPlayerItem.init(asset: compo)
        item.videoComposition = a
        player = AVPlayer.init(playerItem: item)
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

