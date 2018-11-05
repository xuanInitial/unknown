//
//	UnKnownData.swift
//
//	Create by bihu_Mac on 6/4/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

import ObjectMapper
class UnKnownData : Mappable {

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
    
    required init!(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        anchorCity    <- map["anchorCity"]
        avatarMid         <- map["avatarMid"]
        avatarSmall      <- map["avatarSmall"]
        cateId       <- map["cateId"]
        childId  <- map["childId"]
        gameName  <- map["gameName"]
        iconUrl     <- map["iconUrl"]
        isVertical     <- map["isVertical"]
        isNobleRec     <- map["isNobleRec"]
        jumpUrl     <- map["jumpUrl"]
        nickname     <- map["nickname"]
        online     <- map["online"]
        ownerUid     <- map["ownerUid"]
        ranktype     <- map["ranktype"]
        roomName     <- map["roomName"]
        roomSrc     <- map["roomSrc"]
        showStatus     <- map["showStatus"]

        showTime     <- map["showTime"]
        showType     <- map["showType"]
        specificCatalog     <- map["specificCatalog"]
        specificStatus     <- map["specificStatus"]
        subject     <- map["subject"]
        verticalSrc     <- map["verticalSrc"]
        vodQuality     <- map["vodQuality"]
        vertical_src     <- map["vertical_src"]
        anchor_city     <- map["anchor_city"]
        room_name     <- map["room_name"]
        room_id     <- map["room_id"]
        
    }
    
}









