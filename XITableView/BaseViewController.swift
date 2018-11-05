
//
//  BaseViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/6.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit



class BaseViewController: UIViewController {

    /*
     http://swiftcafe.io/2015/12/27/optional/
     */
    //关于Optional
    
    //只是声明有这个变量
    var contentView :UIView?
    //开辟了空间
    //  var contentView = UIView()
    
   //懒加载
    fileprivate lazy var animImageView:UIImageView = {
        let imageView = UIImageView (image: UIImage (named: "img_loading_1"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.center = self.view.center
        imageView.animationImages = [UIImage (named: "img_loading_1")!, UIImage (named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin]
        return imageView
    
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
         setupUI()
        
       
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension BaseViewController {
    
    func setupUI() {
        // 1.隐藏内容的View
        contentView?.isHidden = true
        
        // 2.添加执行动画的UIImageView
        view.addSubview(animImageView)
        
        // 3.给animImageView执行动画
        animImageView.startAnimating()
        
        // 4.设置view的背景颜色
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished() {
        // 1.停止动画
        animImageView.stopAnimating()
        
        // 2.隐藏animImageView
        animImageView.isHidden = true
        
        // 3.显示内容的View
        contentView?.isHidden = false
    }
    
}
