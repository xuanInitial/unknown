//
//  SecondViewController.swift
//  XITableView
//
//  Created by bihu_Mac on 2017/4/5.
//  Copyright © 2017年 initial. All rights reserved.
//

import UIKit

import Kingfisher
import JXPhotoBrowser

class SecondViewController: UIViewController {
    
    private lazy var thumbnailImageUrls: [String] = {
        return ["http://wx1.sinaimg.cn/thumbnail/bfc243a3gy1febm7n9eorj20i60hsann.jpg",
                "http://wx3.sinaimg.cn/thumbnail/bfc243a3gy1febm7nzbz7j20ib0iek5j.jpg",
                "http://wx1.sinaimg.cn/thumbnail/bfc243a3gy1febm7orgqfj20i80ht15x.jpg",
                "http://wx2.sinaimg.cn/thumbnail/bfc243a3gy1febm7pmnk7j20i70jidwo.jpg",
                "http://wx3.sinaimg.cn/thumbnail/bfc243a3gy1febm7qjop4j20i00hw4c6.jpg",
                "http://wx4.sinaimg.cn/thumbnail/bfc243a3gy1febm7rncxaj20ek0i74dv.jpg",
                "http://wx2.sinaimg.cn/thumbnail/bfc243a3gy1febm7sdk4lj20ib0i714u.jpg",
                "http://wx4.sinaimg.cn/thumbnail/bfc243a3gy1febm7tekewj20i20i4aoy.jpg",
                "http://wx3.sinaimg.cn/thumbnail/bfc243a3gy1febm7usmc8j20i543zngx.jpg",]
    }()
    
    private lazy var highQualityImageUrls: [String] = {
        return ["http://wx1.sinaimg.cn/large/bfc243a3gy1febm7n9eorj20i60hsann.jpg",
                "http://wx3.sinaimg.cn/large/bfc243a3gy1febm7nzbz7j20ib0iek5j.jpg",
                "http://wx1.sinaimg.cn/large/bfc243a3gy1febm7orgqfj20i80ht15x.jpg",
                "http://wx2.sinaimg.cn/large/bfc243a3gy1febm7pmnk7j20i70jidwo.jpg",
                "http://wx3.sinaimg.cn/large/bfc243a3gy1febm7qjop4j20i00hw4c6.jpg",
                "http://wx4.sinaimg.cn/large/bfc243a3gy1febm7rncxaj20ek0i74dv.jpg",
                "http://wx2.sinaimg.cn/large/bfc243a3gy1febm7sdk4lj20ib0i714u.jpg",
                "http://wx4.sinaimg.cn/large/bfc243a3gy1febm7tekewj20i20i4aoy.jpg",
                "http://wx3.sinaimg.cn/large/bfc243a3gy1febm7usmc8j20i543zngx.jpg",]
    }()
    
    weak private var selectedCell: MomentsPhotoCollectionViewCell?
    
    private var collectionView: UICollectionView?
    
    deinit {
        #if DEBUG
            print("deinit:\(self)")
        #endif
    }
    
    override func viewDidLoad() {
        self.title = "第二页"
        self.view.backgroundColor = UIColor.white
        
        let colCount = 3
        let rowCount = 3
        
        let xMargin: CGFloat = 60.0
        let interitemSpacing: CGFloat = 10.0
        let width: CGFloat = self.view.bounds.size.width - xMargin * 2
        let itemSize: CGFloat = (width - 2 * interitemSpacing) / CGFloat(colCount)
        
        let lineSpacing: CGFloat = 10.0
        let height = itemSize * CGFloat(rowCount) + lineSpacing * 2
        let y: CGFloat = 60.0
        
        let frame = CGRect(x: xMargin, y: y, width: width, height: height)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interitemSpacing
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.register(MomentsPhotoCollectionViewCell.self, forCellWithReuseIdentifier: MomentsPhotoCollectionViewCell.defalutId)
        
        view.addSubview(cv)
        
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = UIColor.white
        collectionView = cv
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbnailImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MomentsPhotoCollectionViewCell.defalutId, for: indexPath) as! MomentsPhotoCollectionViewCell
        cell.imageView.kf.setImage(with: URL(string: thumbnailImageUrls[indexPath.row]))
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MomentsPhotoCollectionViewCell else {
            return
        }
        selectedCell = cell

        openPhotoBrowser(with: collectionView, indexPath: indexPath, array: highQualityImageUrls)
        
        
    }
}



func openPhotoBrowser(with collectionView: UICollectionView, indexPath: IndexPath ,array:[String]) {
    
    
    // 网图加载器
    let loader = JXKingfisherLoader()
    // 数据源
    let dataSource = JXRawImageDataSource(photoLoader: loader, numberOfItems: { () -> Int in
        return array.count
    }, placeholder: { index -> UIImage? in
        let cell = collectionView.cellForItem(at: indexPath) as? MomentsPhotoCollectionViewCell
        return cell?.imageView.image
    }, autoloadURLString: { index -> String? in
        return array[index]
    }) { index -> String? in
        return array[index]
    }
    // 视图代理，实现了光点型页码指示器
    let delegate = JXDefaultPageControlDelegate()
    // 转场动画
    let trans = JXPhotoBrowserZoomTransitioning { (browser, index, view) -> UIView? in
        let indexPath = IndexPath(item: index, section: 0)
        return collectionView.cellForItem(at: indexPath)
    }
    // 打开浏览器
    JXPhotoBrowser(dataSource: dataSource, delegate: delegate, transDelegate: trans)
        .show(pageIndex: indexPath.item)
    
    
}


