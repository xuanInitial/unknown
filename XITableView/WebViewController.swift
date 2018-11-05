//
//  WebViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/7.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit

// MARK: - Class： WebViewController
class WebViewController: UIViewController {
    // MARK: - 属性
    fileprivate var webView = UIWebView(frame: .zero)
    fileprivate var urlStr: String?
    fileprivate let loadProgressAnimationView: LoadProgressAnimationView = LoadProgressAnimationView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 3))
    
    // MARK: - 生命周期
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.addSubview(webView)
        webView.addSubview(loadProgressAnimationView)
        webView.scalesPageToFit = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(navigationTitle: String, urlStr: String) {
        self.init(nibName: nil, bundle: nil)
        navigationItem.title = navigationTitle
        webView.loadRequest(URLRequest(url: URL(string: urlStr)!))
        self.urlStr = urlStr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = self.view.frame
        automaticallyAdjustsScrollViewInsets = true
        view.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.colorWithCustom(r: 230, g: 230, b: 230)
        
        
        webView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: view.frame.size.height )
        webView.backgroundColor = UIColor.colorWithCustom(r: 230, g: 230, b: 230)
        webView.delegate = self
        webView.dataDetectorTypes = .all // 设置某些数据变为链接形式，这个枚举可以设置如电话号，地址，邮箱等转化为链接
        webView.mediaPlaybackAllowsAirPlay = true //设置音频播放是否支持ari play功能
        webView.suppressesIncrementalRendering = true // 设置是否将数据加载如内存后渲染界面
        webView.keyboardDisplayRequiresUserAction = true // 设置用户交互模式
        //        webView.paginationMode = .topToBottom // 这个属性用来设置一种模式，当网页的大小超出view时，将网页以翻页的效果展示
        webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 64, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buildRightItemBarButton()
        buildLeftItemBarButton()
    }
    
    
    // MARK: - 导航栏  refreshClick
    fileprivate func buildRightItemBarButton() {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        rightButton.setImage(UIImage(named: "find_1"), for: UIControlState.normal)
       
        rightButton.addTarget(self, action: #selector(WebViewController.refreshClick), for: UIControlEvents.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    // MARK: - 导航栏  leftBtnClick
    fileprivate func buildLeftItemBarButton() {
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        leftButton.setImage(UIImage(named: "find"), for: UIControlState.normal)

        leftButton.addTarget(self, action: #selector(WebViewController.leftBtnClick), for: UIControlEvents.touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    
    // MARK: - Action
    @objc fileprivate func refreshClick() {
        if webView.request?.url != nil && webView.request!.url!.absoluteString.characters.count > 1 {
            webView.loadRequest(URLRequest(url: (webView.request?.url!)!))
        }
    }
    
    @objc fileprivate func leftBtnClick() {
        
        self.navigationController!.popViewController(animated: true)
      
    }
}

// MARK: - UIWebViewDelegate

extension WebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadProgressAnimationView.startLoadProgressAnimation()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadProgressAnimationView.endLoadProgressAnimation()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        loadProgressAnimationView.endLoadProgressAnimation()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let str = request.url?.absoluteString
        if (str?.hasPrefix("tel:"))! {
            let url = URL(string: str!)
            if UIApplication.shared.canOpenURL(url!) {
                
                //iOS10打开外部的新方法
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open((URL(string: str!))!, options: [:], completionHandler: { (succer) in
                        print("\(succer)")
                    })
                } else {
                    // Fallback on earlier versions
                }
                return false
            }
        }
        return true
    }
}




// MARK: -
// MARK: - Class： LoadProgressAnimationView
class LoadProgressAnimationView: UIView {
    
    var viewWidth: CGFloat = 0
    override var frame: CGRect {
        willSet {
            if frame.size.width == viewWidth {
                self.isHidden = true
            }
            super.frame = frame
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewWidth = frame.size.width
        backgroundColor = UIColor.randomColor()
        self.frame.size.width = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - 加载进度动画
    func startLoadProgressAnimation() {
        self.frame.size.width = 0
        isHidden = false
        UIView.animate(withDuration: 0.8, animations: { () -> Void in
            self.frame.size.width = self.viewWidth * 0.70
            
        }) { (finish) -> Void in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.08, execute: {
                UIView.animate(withDuration: 0.3, animations: {
                    self.frame.size.width = self.viewWidth * 0.85
                })
            })
        }
    }
    
    func endLoadProgressAnimation() {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.frame.size.width = self.viewWidth*0.99
        }) { (finish) -> Void in
            self.isHidden = true
        }
    }
}
