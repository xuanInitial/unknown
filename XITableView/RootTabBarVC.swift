//
//  RootTabBarVC.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/5.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit



class RootTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
          /*
 
         let homeVC = FirstViewController()
         let unKnown = UnKnownViewController()
         let myVC = MyViewController()
        
         
         homeVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
         unKnown.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
         myVC.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
 
  */
        
   
        //创建ViewController
        let homeVC=FirstViewController()
        let unKnown=UnKnownViewController()
        let yyDance = YYDanceViewController()
        let myVC=MyViewController()
        
        homeVC.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        unKnown.tabBarItem = UITabBarItem.init(title: "发现", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        yyDance.tabBarItem = UITabBarItem.init(title: "YY", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        myVC.tabBarItem = UITabBarItem.init(title: "我", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
      
 
        let n1 = RootNavigationController.init(rootViewController: homeVC)
        let n2 = RootNavigationController.init(rootViewController: unKnown)
        let n3 = RootNavigationController.init(rootViewController: yyDance)
        let n4 = RootNavigationController.init(rootViewController: myVC)
       
        self.viewControllers = [n1,n2,n3,n4]
        
        self.selectedIndex = 0; //选中第一行
        
        self.tabBar.tintColor = UIColor.black
        
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
