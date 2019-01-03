//
//  YYDanceViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/9/25.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit

import SwiftyJSON
import ObjectMapper
import Alamofire
import SafariServices //SFSafariViewController  用到这个网页需要引入

class YYDanceViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    
    let danceTableView = UITableView()
    fileprivate lazy var danceListDate : [DanceData] = []  //创建一个数组
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "YY"
        self.view.backgroundColor = UIColor.white
        
        danceTableView.frame = CGRect (x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-49)
        danceTableView.delegate = self;
        danceTableView.dataSource = self;
        danceTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        danceTableView.register(DanceTableViewCell.self, forCellReuseIdentifier: "danceTableView")
        self.view .addSubview(danceTableView)
        loadData()
        setUpRefresh()
        buildRightItemBarButton()
    }

    // MARK: - 导航栏  refreshClick
    fileprivate func buildRightItemBarButton() {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        rightButton.setImage(UIImage(named: "favor_1"), for: UIControlState.normal)
        
        rightButton.addTarget(self, action: #selector(refreshClick), for: UIControlEvents.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    @objc fileprivate func refreshClick() {
       
//        let urlstring = "https://wap.yy.com/mobileweb/60987719/60987719?timestamp=1546493663&sharedOid=1056750511&version=7.14.0&edition=1&platform=1&config_id=55&userUid=2174357578&uid="
        
          let urlstring = "http://www.yy.com/"+"\(60987719)/"+"\(60987719)?"+"tempId="+"\(2174357578)"
        
        let webVC = WebViewController(navigationTitle: "静静", urlStr: urlstring)
        
        webVC.hidesBottomBarWhenPushed = true
        
        self.navigationController!.pushViewController(webVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func setUpRefresh() {
        // MARK: - 下拉
        self.danceTableView.header = MJRefreshGifHeader(refreshingBlock: { [weak self]() -> Void in
            self?.loadData()
            self!.danceTableView.header.endRefreshing()
        })
        self.danceTableView.header.isAutoChangeAlpha = true
        self.danceTableView.header.beginRefreshing()
    }
    func loadData() {
        
        GitHubProvider.request(.zen) { result in
            var message = "Couldn't access API"
            if case let .success(response) = result {
                
                let jsonString = try? response.mapString()
                message = jsonString ?? message
                debugPrint(jsonString ?? "")
                let model = Mapper<DanceRootClass>().map(JSONString:jsonString!)
               
                let listmodel = model?.data!
                
                self.danceListDate = listmodel!

                
                
            }
            
            if case let .failure(error) = result {
                debugPrint(error)
            }
            
        }
        Network.requestData(.GET, URLString: "https://data.3g.yy.com/mobyy/nav/sing/dance?bkt=0&channel=appstore&compAppid=yymip&hdid=b155de5b7367f2f50fc3e2a25ea20d02328239db&imei=b155de5b7367f2f50fc3e2a25ea20d02328239db&ispType=1&loadType=1&mac=b155de5b7367f2f50fc3e2a25ea20d02328239db&model=iPhone8%2C1&netType=2&os=iOS&osVersion=12.1&stype=2&uid=496425918&yyVersion=7.14.1&yyplugins=11%2C12%2C113") { (result) in
            
        let model = Mapper<DanceRootClass>().map(JSON: result as! [String : Any])
            self.danceListDate = (model?.data![0].data)!
            
            self.danceTableView.reloadData()
        }
      
        

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.danceListDate.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "danceTableView") as!DanceTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.data = self.danceListDate[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
         let data = danceListDate[indexPath.row]
        print("......");
        let urlstring = "http://www.yy.com/"+"\(data.sid ?? 57301213)/"+"\(data.sid ?? 57301213)?"+"tempId="+"\(data.uid ?? 57301213)"
        
        let webVC = WebViewController(navigationTitle: data.name!, urlStr: urlstring)
        
            webVC.hidesBottomBarWhenPushed = true
        
          self.navigationController!.pushViewController(webVC, animated: true)
        
//        let safariVC = SFSafariViewController(url: URL(string: urlstring)!, entersReaderIfAvailable: true)
//        // 2.以Modal方式弹出
//        present(safariVC, animated: true, completion: nil)
        
    }
        
      

}
