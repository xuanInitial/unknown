//
//  ViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/1.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit

import Alamofire


import FLAnimatedImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    
    
    
    var nameArr = ["川香麻辣烫","乌山烤鱼","Starbucks","小肥羊","贺野日本料理","湘乐汇","蜀记","Coasta Coffee","DC冰激凌","哈根达斯","二人转烧烤"]
    
    var tableView = UITableView()
    
    var navBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.green
        self.title = "加载网络GIF"
        tableView.frame = CGRect (x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        tableView.delegate = self;
        tableView.dataSource = self;
        //重要注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        /*
         另一种注册方法
          let nib = UINib(nibName: "Cell", bundle: nil)
         self.tableView.register(nib, forCellReuseIdentifier:"Cell")
         */
        
        /*
         不加会出现这个错误
         fatal error: unexpectedly found nil while unwrapping an Optional value
         
         //这个错误也是因为没有注册
         Assertion failure in -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:],
         
         */
        
        self.view .addSubview(tableView)
        
        navBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        navBtn .addTarget(self, action: #selector(navBtnClick), for: UIControlEvents.touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navBtn)
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //MARK--   dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)  使用这个
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
      
        
         // 有bug
        

//        
//        cell.imageView?.kf.setImage(with: URL (fileURLWithPath: path!))

//        let gifView = LoadingGifView()
//        
//        gifView.frame = CGRect (x: 10, y: 0, width: 100, height: 100)
//        
//        gifView.showGifImagwWithLocalName(name: "dongtu")
//        
//        cell.contentView .addSubview(gifView)
        
        
        let label = UILabel()
        
        label.frame = CGRect (x: 120, y: 0, width: 100, height: 30);
        
        label.text = nameArr[indexPath.row];
        cell.contentView .addSubview(label);
        
        let imageView = FLAnimatedImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
         cell.contentView.addSubview(imageView)
        

        
        let imageURLString = "https://media.giphy.com/media/Nm8ZPAGOwZUQM/giphy.gif"
        if let imageURL = URL (string: imageURLString) {
            //读取图片
            let session = URLSession(configuration: URLSessionConfiguration.default)
            session.dataTask(with: imageURL, completionHandler: { (data, response, error) in
                
                if data != nil {
                    
                    let image = FLAnimatedImage(animatedGIFData: data)
                    imageView.animatedImage = image
                    
                }
                
            }).resume()
            
        }
        
        
        return cell;
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView .deselectRow(at: indexPath, animated: true)
        print("点击了\(indexPath.row)")
        
       
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //swift 网络请求
    private func loadFlavors() {
        
        Alamofire.request("https://httpbin.org/get").response { response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        
    }
    
    
    @objc func navBtnClick(){
        let thirdVC = ThirdViewController()
        
        thirdVC.titleString = "动图大";
        self.navigationController!.pushViewController(thirdVC, animated: true)
        
        
    }

}


