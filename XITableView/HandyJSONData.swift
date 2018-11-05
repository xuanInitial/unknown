//
//  HandyJSONData.swift
//  XITableView
//
//  Created by initial on 2018/8/20.
//  Copyright © 2018年 initial. All rights reserved.
//

import UIKit
import HandyJSON

class HandyJSONData: HandyJSON {

    var anchorCity : String!
    var avatarMid : String!
    var avatarSmall : String!
    var cateId : NSNumber!
    var childId : NSNumber!
    var gameName : String!
    var iconUrl : String!
    var isVertical : NSNumber!     // 0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
    var isNobleRec : NSNumber!
    var jumpUrl : String!/// 直播网址
    var nickname : String!
    var online : NSNumber!
    var ownerUid : String!
    var ranktype : NSNumber!
    var roomId : String!
    var roomName : String!
    var roomSrc : String!
    var showStatus : String!
    var showTime : String!
    var showType : NSNumber!
    var specificCatalog : String!
    var specificStatus : String!
    var subject : String!
    var verticalSrc : String!
    var vodQuality : String!
    var vertical_src: String!
    /// 所在城市
    var anchor_city : String!
    /// 房间名称
    var room_name : String!
    var room_id : String?
    
    required init() {
        
    }
}
