//
//  UnKnownCVCell.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/6.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit
import FLAnimatedImage
import Kingfisher
class UnKnownCVCell: UICollectionViewCell {
    
    var data:HandyJSONData!{
        didSet {
            
           print("\(data)")
            guard let iconURL = URL(string: (data.vertical_src))
                else {
                return
            }
            iconImg.kf.setImage(with: iconURL, placeholder: #imageLiteral(resourceName: "placehoderImage"))
            
            var onlineStr : String!
            if Int(truncating: (data.online)) >= 10000 {
                onlineStr = "\(Int(truncating: (data.online)!)/10000)万人在线"
            } else {
                onlineStr = "\(Int(truncating: (data.online)!))人在线"
            }
            peopleNumber.setTitle(onlineStr, for: UIControlState())
            peopleNumber.sizeToFit()
            
            // 2.昵称的显示
            name.setTitle(data.nickname, for: UIControlState())
            
            // 3.设置位置(所在的城市)
            address.setTitle(data.anchor_city, for: UIControlState())
        }
    
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    fileprivate func createUI(){
        contentView .addSubview(iconImg)
        contentView.addSubview(name)
        contentView.addSubview(address)
        contentView.addSubview(peopleNumber)
        
        iconImg.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(self.frame.size.width)
            make.height.equalTo(self.frame.size.height-30)
            
        }
        
        peopleNumber.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        name.snp.makeConstraints { (make)  in
            
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        address.snp.makeConstraints { (make)  in
            
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
    }
    
    // MARK: - 懒加载
    fileprivate lazy var iconImg:UIImageView = {
        let iconImg = UIImageView()
        iconImg.layer.cornerRadius = 6
        iconImg.layer.masksToBounds = true
        
        return iconImg
    }()

    
    fileprivate lazy var peopleNumber:UIButton = {
        let peopleNumber = UIButton (type: UIButtonType.custom)
        
        peopleNumber .setImage(UIImage (named: "Image_online"), for: UIControlState.normal)
        peopleNumber.setTitle("更多", for: UIControlState())
        peopleNumber.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return peopleNumber
    }()
    
    fileprivate lazy var address:UIButton = {
        let address = UIButton (type: UIButtonType.custom)
        
        address .setImage(UIImage (named: "ico_location"), for: UIControlState.normal)
        address.setTitle("帝都", for: UIControlState())
         address.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        address.setTitleColor(UIColor.black, for: UIControlState.normal)
        return address
    }()
    
    fileprivate lazy var name:UIButton = {
        let name = UIButton (type: UIButtonType.custom)
        
        name .setImage(UIImage (named: "home_live_cate_normal"), for: UIControlState.normal)
        name.setTitle("夏天到了春天还会远吗", for: UIControlState())
        name.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    
        name.setTitleColor(UIColor.black, for: UIControlState.normal)
        return name
    }()
    
}
