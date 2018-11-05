//
//  LoadingGifView.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/5.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit
import ImageIO
import QuartzCore

class LoadingGifView: UIView {

    var width:CGFloat{return self.frame.size.width}
    var height:CGFloat{return self.frame.size.height}
    private var gifurl:NSURL!
    private var totalTime:Float = 0
    private var imageArray:Array<CGImage> = []
    private var timeArray:Array<NSNumber> = []
    
    /**
     * 本地加载GIF图片
     */
    func showGifImagwWithLocalName(name: String) {
        gifurl = Bundle.main.url(forResource: name, withExtension: "gif") as NSURL!
        self.createFrame()
    }
    
   
    func createFrame() {
        let url:CFURL = gifurl as CFURL!
        let gifSource = CGImageSourceCreateWithURL(url, nil)
        let imageCount = CGImageSourceGetCount(gifSource!)
        for i in 0..<imageCount {
            let imageRef = CGImageSourceCreateImageAtIndex(gifSource!, i, nil)
            imageArray.append(imageRef!)
            let sourceDict = CGImageSourceCopyPropertiesAtIndex(gifSource!, i, nil) as NSDictionary!
            let imageWidth = sourceDict![String(kCGImagePropertyPixelWidth)] as! NSNumber
            let imageHeight = sourceDict![String(kCGImagePropertyPixelHeight)] as! NSNumber
            if imageWidth.floatValue/imageHeight.floatValue != Float(width/height) {
                self.fitSacle(imageWidth: CGFloat(truncating: imageWidth), imageHeight: CGFloat(truncating: imageHeight))
            }
            
            let gifDict = sourceDict![String(kCGImagePropertyGIFDictionary)] as! NSDictionary
            let time = gifDict[String(kCGImagePropertyGIFDelayTime)] as! NSNumber
            timeArray.append(time)
            totalTime += time.floatValue
        }
        self.showAnimation()
    }
    
    /**
     *  适应长宽高
     */
    func fitSacle(imageWidth:CGFloat, imageHeight:CGFloat) {
        var newWidth:CGFloat
        var newHeight:CGFloat
        if imageWidth/imageHeight > width/height {
            newHeight = width/(imageWidth/imageHeight)
            newWidth = width
        }else{
            newWidth = height*(imageWidth/imageHeight)
            newHeight = height
        }
        let point:CGPoint = self.center
        self.frame.size = CGSize(width: newWidth, height: newHeight)
        self.center = point
    }
    
    /**
     * 展示GIF
     */
    func showAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "contents")
        var currentTime:Float = 0
        var timeKeys:Array<NSNumber> = []
        
        for time in timeArray {
            timeKeys.append(NSNumber(value: Float(currentTime/totalTime)))
            currentTime += time.floatValue
        }
        animation.keyTimes = timeKeys
        animation.values = imageArray
        animation.duration = TimeInterval(totalTime)
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        self.layer.add(animation, forKey: "LoadingGifView")
    }
    

}
