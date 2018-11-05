//
//  ThirdViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/5.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit
import FLAnimatedImage



class ThirdViewController: UIViewController {

    open var titleString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = titleString
        createUI()
    }

    func createUI() {
        
        let imageView = FLAnimatedImageView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64))
       self.view.addSubview(imageView)
        
        let x = arc4random() % 4;
        
        let gifurl = Bundle.main.url(forResource: String(x), withExtension: "gif") as URL?
        
        if let imageURL = gifurl {
            //读取图片
            let session = URLSession(configuration: URLSessionConfiguration.default)
            session.dataTask(with: imageURL, completionHandler: { (data, response, error) in
                
                if data != nil {
                    
                    let image = FLAnimatedImage(animatedGIFData: data)
                    imageView.animatedImage = image
                    
                }
                
            }).resume()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
