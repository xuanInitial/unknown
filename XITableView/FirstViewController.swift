//
//  FirstViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/1.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,FirstVCDelegate {

    var firstTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "首页"

    
        
        firstTableView.frame = CGRect (x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-49)
        firstTableView.delegate = self;
        firstTableView.dataSource = self;
        firstTableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstCell")
        self.view .addSubview(firstTableView)
     //   loadData()
    //    requestDat()
        
        testState()
        
    }
    
    fileprivate func loadData(){
        
        
      firstTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell  必须加  as！ 不然找不到cell里面的方法
        let cell = tableView .dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as!FirstTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.delegate = self
    
        return cell;
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView .deselectRow(at: indexPath, animated: true)
        
        print("点击了\(indexPath.row)行")
        
        let secondVC = SecondViewController()
        
        secondVC.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(secondVC, animated: true)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func gengduoClick(_cell: FirstTableViewCell, with: UIButton) {
   
        print("更多\(with)")
        let vc = ViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(vc, animated: true)
    }

    func requestDat(){
        
        //默认get请求
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
            
        }
        
        
        
        //修改默认队列
        let utilityQueue = DispatchQueue.global(qos: .utility)
        
        Alamofire.request("https://httpbin.org/get").responseJSON(queue: utilityQueue) { response in
            print("Executing response handler on utility queue")
        }
        
        
        //post
        Alamofire.request("https://httpbin.org/get", method: .post).responseJSON { response in
            
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
        }
        
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ]
        
        Alamofire.request("https://httpbin.org/headers", headers: headers).responseJSON { response in
            debugPrint(response)
        }
        
        let l = "aaa"
        let w  = 9
        
        let wh = l +  String(w)
        
        print(wh)
        
        
        
        
    }
    
    func testState(){
        let emptyArray = [String]()
        let emptyDictionary = [String: Float]()
        
        
//        let v = "aaa";
//
//        switch v {
//        case "as":
//            print("")
//
//        default:
//           print("1234")
//        }
        
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
            ]
        var largest = 0
        var k  = String()
        
        for (kind, numbers) in interestingNumbers {
            
            for number in numbers {
                if number > largest {
                    largest = number
                    k = kind
                }
            }
        }
     //   print(largest,k)
        

        var n = 2

        while n < 100 {
            n = n * 2
        //     print(n)
        }
       
        
        var total = 0
        for i in 0...4 {//..< 与...
            total += i
         //    print(total)
        }
       
      //  print(sumOf(numbers: 1, 2, 3,4,5))
        
        let increment = makeIncrementer()
        
     //   print(increment(7))
        
        let  numbers = [20, 19, 11, 12]
     //  print( hasAnyMatches(list: numbers, condition: lessThanTen))
       
        
        let mappedNumbers = numbers.map({ number in 3 * number })
        print(mappedNumbers)
        
        
        let sortedNumbers = numbers.sorted { $0 < $1 }//
        print(sortedNumbers)
    }
    
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
   
    
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
   
    func firstbeng(){
        
    }
    

}
