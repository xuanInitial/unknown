//
//  DanceTableViewCell.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/9/25.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit

class DanceTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //构造方法
    required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        CreateUI()
    }
    
   fileprivate  func CreateUI(){
        self.contentView.addSubview(iconImg)
         self.contentView.addSubview(titLabel)
    
    
        iconImg.snp.makeConstraints { (make) -> Void in
        make.left.equalTo(15)
        make.top.equalTo(0)
        make.width.equalTo(SCREEN_WIDTH-30)
        make.height.equalTo(320)
        
    }
    
        titLabel.snp.makeConstraints { (make) -> Void in
        make.right.equalTo(0)
        make.top.equalTo(iconImg.snp.bottom).offset(0)
        make.width.equalTo(SCREEN_WIDTH)
        make.height.equalTo(30)
    }
        
    }
    
    
    fileprivate lazy var iconImg:UIImageView = {
        let iconImg = UIImageView()
        iconImg.layer.cornerRadius = 6
        iconImg.image = UIImage.init(named: "goodicon_6")
        iconImg.layer.masksToBounds = true
        
        return iconImg
    }()
    fileprivate lazy var titLabel:UILabel = {
        let titLabel = UILabel()
        titLabel.text = "......"
        titLabel.textAlignment = NSTextAlignment.center
        return titLabel
        
    }()
    
    
    
    var data:DanceData!{
        didSet {
            
            print("\(data)")
            guard let iconURL = URL(string: (data.thumb)!)
                else {
                    return
            }
            iconImg.kf.setImage(with: iconURL, placeholder: #imageLiteral(resourceName: "placehoderImage"))
            
            
            titLabel.text = data.desc!
            
            
      
        }
        
        
    }
    
    
    
}
