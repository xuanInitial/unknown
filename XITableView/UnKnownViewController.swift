//
//  UnKnownViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/5.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
import ObjectMapper
import SafariServices //SFSafariViewController  用到这个网页需要引入

private let kCycleViewH = SCREEN_WIDTH * 3 / 8          /** 轮播器的高度 */
let kGameViewH : CGFloat = 90               /** 游戏View的高度 */
let kItemMargin : CGFloat = 10              /** item之间的间距 */
let kHeaderViewH : CGFloat = 50             /** item之间的间距 */
let kNormalItemW = (SCREEN_WIDTH - 3 * kItemMargin) / 2 /** item的宽度 */
let kNormalItemH = kNormalItemW * 3 / 4             /** 普通item的高度 */
let kPrettyItemH = kNormalItemW * 4 / 3             /** 颜值的item的高度 */
let kPrettyCellID = "kPrettyCellID"         /** 颜值的item的循环利用标识符 */


class UnKnownViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    // MARK:- ViewModel
    fileprivate lazy var allListVM : [HandyJSONData] = []  //创建一个数组
    
    fileprivate lazy var collectionView : UICollectionView = {  //懒加载
        // 1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kPrettyItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin;

         layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        // 2.创建UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // 3.注册
        collectionView.register(UnKnownCVCell.self, forCellWithReuseIdentifier: kPrettyCellID)
        return collectionView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "未知"

        loadData()
        setupUI()
        setUpRefresh()
    }
    
    func setupUI() {
        self.view.addSubview(collectionView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    fileprivate func loadData() {
        
//        Alamofire.request(GETYANZHI).responseJSON { response in
//            //            print("Request: \(String(describing: response.request))")
//            //            print("Response: \(String(describing: response.response))")
//            //            print("Error: \(String(describing: response.error))")
//
//            if let jsonString = response.result.value{
//
//                print("\(jsonString)")
//
//                //                guard let resultDict = jsonString as? [String : NSObject] else { return }
//                //
//                //                // 2.根据data该key,获取数组
//                //                guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
//
//                //运用SwiftyJSON +MJExtension
//                let dataJson = JSON(jsonString)["data"].rawValue
//                let model = UnKnownData.mj_objectArray(withKeyValuesArray: dataJson) as Array
//
//                self.allListVM = model as! [UnKnownData]
//
//                self.collectionView.reloadData()
//
//            }
//        }
        
        // Alamofire 4
//        Alamofire.request(GETYANZHI, method: .get, parameters: nil, encoding: JSONEncoding.default)
//            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
//                print("Progress: \(progress.fractionCompleted)")
//            }
//            .validate { request, response, data in
//                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
//                return .success
//            }
//            .responseJSON { response in
//                debugPrint(response)
//                 if let jsonString = response.result.value{
//
//                    let dataJson = JSON(jsonString)["data"].rawValue
//               //     let json =   try jsonString.mapJSON()
//
//              //      let model = Mapper<UnKnownData>().mapArray(JSONString:(dataJson as? String)!)
//
//
//
//                 //   self.allListVM = model!
//                 //   self.collectionView.reloadData()
//                }
//
//        }
        
        GitHubProvider.request(.zen) { result in
            var message = "Couldn't access API"
            if case let .success(response) = result {
                
                let jsonString = try? response.mapString()
                message = jsonString ?? message
                debugPrint(jsonString ?? "")
//                let model = Mapper<UnKnownRootClass>().map(JSONString:jsonString!)
//                self.allListVM = (model?.data!)!
                
                
                if let object = HandyJSONRootClass.deserialize(from: jsonString) {
                    self.allListVM = (object.data)!
                    
                    object.data?.forEach({ (cat) in //forEach  语句用于循环访问集合以获取所需信息，但不应用于更改集合内容以避免产生不可预知的副作用。
                        // ...
                        print("111111111111111111111",  cat .toJSON()!);
                    })

                }
                
//                if let cat = HandyJSONData.deserialize(from: jsonString, designatedPath: "jsonString.data") {
//                    self.allListVM = [cat]
//                }
                
                
                self.collectionView.reloadData()
            }
            
            if case let .failure(error) = result {
                debugPrint(error)
            }
        
        }
        
        
    }
    
    
    fileprivate func setUpRefresh() {
        // MARK: - 下拉
        self.collectionView.header = MJRefreshGifHeader(refreshingBlock: { [weak self]() -> Void in
            self?.loadData()
            self!.collectionView.header.endRefreshing()
        })
        self.collectionView.header.isAutoChangeAlpha = true
        self.collectionView.header.beginRefreshing()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allListVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 1.取出Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! UnKnownCVCell
        
        // 2.给cell设置数据
        cell.data = self.allListVM[(indexPath as NSIndexPath).item]
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 1.取出对应的主播信息
        let data = allListVM[indexPath.item]
        
        // 2.判断是秀场房间&普通房间   0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
        data.isVertical == 0 ? pushNormalRoomVc(data: data) : presentShowRoomVc(data: data)
        
    }
    
    //1 : 手机直播(秀场房间)
    fileprivate func presentShowRoomVc(data: HandyJSONData) {
        if #available(iOS 9.0, *) {
            // 1.创建SFSafariViewController
            let urlstring = "http://www.douyu.com/"+"\(data.room_id ?? "3312095")"
            
            let safariVC = SFSafariViewController(url: URL(string: urlstring)!, entersReaderIfAvailable: true)
            // 2.以Modal方式弹出
            present(safariVC, animated: true, completion: nil)
        } else {
             let urlstring = "http://www.douyu.com/"+"\(data.room_id ?? "3312095")"
            let webVC = WebViewController(navigationTitle: data.room_name, urlStr: urlstring)
            present(webVC, animated: true, completion: nil)
        }
    }
    //0 : 电脑直播(普通房间)
    fileprivate func pushNormalRoomVc(data: HandyJSONData) {
        // 1.创建WebViewController
         let urlstring = "http://www.douyu.com/"+"\(data.room_id ?? "3312095")"
        let webVC = WebViewController(navigationTitle: data.room_name, urlStr: urlstring)
        webVC.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // 2.以Push方式弹出
        navigationController?.pushViewController(webVC, animated: true)
    }
}





