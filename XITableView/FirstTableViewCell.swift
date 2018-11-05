//
//  FirstTableViewCell.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/1.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit

import SnapKit

protocol FirstVCDelegate:NSObjectProtocol {
    
    func gengduoClick(_cell:FirstTableViewCell, with:UIButton)

}


class FirstTableViewCell: UITableViewCell {

    /// 代理属性
    weak var delegate: FirstVCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: - 构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createUI()
    }
    
   // MARK:方法
    /*
     1，private
     private访问级别所修饰的属性或者方法只能在当前类里访问。
     2，fileprivate
     fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问。（比如上门样例把private改成fileprivate就不会报错了）
     
     3，internal（默认访问级别，internal修饰符可写可不写）
     internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
     如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
     如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
     
     4，public
     可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。
     
     5，open
     可以被任何人使用，包括override和继承。
     */
    //open > public > interal > fileprivate > private
   fileprivate func createUI(){
       contentView .addSubview(iconImg)
        contentView.addSubview(titLabel)
        contentView.addSubview(desLabel)
        contentView.addSubview(addCartBtn)
    
        iconImg.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(12)
            make.top.equalTo(10)
            make.width.equalTo(60)
            make.height.equalTo(60)
            
        }
    
        titLabel.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(contentView.snp.top).offset(10)
        make.left.equalTo(iconImg.snp.right).offset(12)
        }
    
        desLabel.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(titLabel.snp.bottom).offset(12)
        make.left.equalTo(iconImg.snp.right).offset(12)
        }
    
        addCartBtn.snp.makeConstraints { (make) -> Void in
        make.right.equalTo(-12)
        make.top.equalTo(25)
        make.width.equalTo(80)
        make.height.equalTo(30)
        }
    
    }
    
    // MARK: - 懒加载
    fileprivate lazy var iconImg:UIImageView = {
        let iconImg = UIImageView()
        iconImg.layer.cornerRadius = 30
        iconImg.layer.masksToBounds = true
        return iconImg
    }()
    
    fileprivate lazy var titLabel:UILabel = {
        let titLabel = UILabel()
        
        return titLabel
    
    }()
    
    fileprivate lazy var desLabel:UILabel = {
       let desLabel = UILabel()
        desLabel.textColor = UIColor.green
        return desLabel
    }()
    
    
    fileprivate lazy var addCartBtn:UIButton = {
        let addCartBtn = UIButton (type: UIButtonType.custom)
        
        addCartBtn .setBackgroundImage(UIImage (named: "button_cart_add"), for: UIControlState.normal)
         addCartBtn.setTitle("更多", for: UIControlState())
        addCartBtn .addTarget(self, action: #selector(didTappedAddCartButton(_:)), for: UIControlEvents.touchUpInside)
        return addCartBtn
    }()
    
    @objc fileprivate func didTappedAddCartButton(_ button: UIButton) {
        
      
        self.delegate?.gengduoClick(_cell: self, with: button)
        
        
        // 已经购买
      //  goodModel!.alreadyAddShoppingCart = true
        
        // 已经点击的就禁用
     //   button.isEnabled = !goodModel!.alreadyAddShoppingCart
        
        // 通知代理对象，去处理后续操作
     //   delegate?.goodListCell(self, iconView: iconView)
    }
    
    
}
