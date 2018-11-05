//
//	DanceData.swift
//
//	Create by bihu_Mac on 25/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DanceData : NSObject, NSCoding, Mappable{

	var arGame : Int?
	var avatar : String?
	var biz : String?
	var desc : String?
	var deviceType : Int?
	var distance : Int?
	var frameQa : Int?
	var gameStyle : Int?
	var groupId : Int?
	var img : String?
	var linkMic : Int?
	var liveTime : Int?
	var logo : String?
	var name : String?
	var pid : String?
	var quality : Int?
	var ru : Int?
	var scale : Int?
	var sid : Int?
	var site : String?
	var snapshot : String?
	var sort : Int?
	var srcVstreamType : Int?
	var ssid : Int?
	var startTime : Int?
	var tag : String?
	var tagStyle : Int?
	var thumb : String?
	var thumb2 : String?
	var totalLike : Int?
	var totalUser : Int?
	var tpl : Int?
	var type : Int?
	var uid : Int?
	var users : Int?
	var verify : Int?
	var vr : Int?
	var yyNum : Int?
	var data : [DanceData]?
	var head : Int?
	var hideTag : Int?
	var id : Int?
	var pageable : Int?
	var recommend : Int?
	var serv : Int?
	var showImpress : Int?
	var tagType : Int?
	var topContentBanner : Int?
	var url : String?


	class func newInstance(map: Map) -> Mappable?{
		return DanceData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		arGame <- map["arGame"]
		avatar <- map["avatar"]
		biz <- map["biz"]
		desc <- map["desc"]
		deviceType <- map["deviceType"]
		distance <- map["distance"]
		frameQa <- map["frameQa"]
		gameStyle <- map["gameStyle"]
		groupId <- map["groupId"]
		img <- map["img"]
		linkMic <- map["linkMic"]
		liveTime <- map["liveTime"]
		logo <- map["logo"]
		name <- map["name"]
		pid <- map["pid"]
		quality <- map["quality"]
		ru <- map["ru"]
		scale <- map["scale"]
		sid <- map["sid"]
		site <- map["site"]
		snapshot <- map["snapshot"]
		sort <- map["sort"]
		srcVstreamType <- map["srcVstreamType"]
		ssid <- map["ssid"]
		startTime <- map["startTime"]
		tag <- map["tag"]
		tagStyle <- map["tagStyle"]
		thumb <- map["thumb"]
		thumb2 <- map["thumb2"]
		totalLike <- map["totalLike"]
		totalUser <- map["totalUser"]
		tpl <- map["tpl"]
		type <- map["type"]
		uid <- map["uid"]
		users <- map["users"]
		verify <- map["verify"]
		vr <- map["vr"]
		yyNum <- map["yyNum"]
		data <- map["data"]
		head <- map["head"]
		hideTag <- map["hideTag"]
		id <- map["id"]
		pageable <- map["pageable"]
		recommend <- map["recommend"]
		serv <- map["serv"]
		showImpress <- map["showImpress"]
		tagType <- map["tagType"]
		topContentBanner <- map["topContentBanner"]
		url <- map["url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         arGame = aDecoder.decodeObject(forKey: "arGame") as? Int
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         biz = aDecoder.decodeObject(forKey: "biz") as? String
         desc = aDecoder.decodeObject(forKey: "desc") as? String
         deviceType = aDecoder.decodeObject(forKey: "deviceType") as? Int
         distance = aDecoder.decodeObject(forKey: "distance") as? Int
         frameQa = aDecoder.decodeObject(forKey: "frameQa") as? Int
         gameStyle = aDecoder.decodeObject(forKey: "gameStyle") as? Int
         groupId = aDecoder.decodeObject(forKey: "groupId") as? Int
         img = aDecoder.decodeObject(forKey: "img") as? String
         linkMic = aDecoder.decodeObject(forKey: "linkMic") as? Int
         liveTime = aDecoder.decodeObject(forKey: "liveTime") as? Int
         logo = aDecoder.decodeObject(forKey: "logo") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         pid = aDecoder.decodeObject(forKey: "pid") as? String
         quality = aDecoder.decodeObject(forKey: "quality") as? Int
         ru = aDecoder.decodeObject(forKey: "ru") as? Int
         scale = aDecoder.decodeObject(forKey: "scale") as? Int
         sid = aDecoder.decodeObject(forKey: "sid") as? Int
         site = aDecoder.decodeObject(forKey: "site") as? String
         snapshot = aDecoder.decodeObject(forKey: "snapshot") as? String
         sort = aDecoder.decodeObject(forKey: "sort") as? Int
         srcVstreamType = aDecoder.decodeObject(forKey: "srcVstreamType") as? Int
         ssid = aDecoder.decodeObject(forKey: "ssid") as? Int
         startTime = aDecoder.decodeObject(forKey: "startTime") as? Int
         tag = aDecoder.decodeObject(forKey: "tag") as? String
         tagStyle = aDecoder.decodeObject(forKey: "tagStyle") as? Int
         thumb = aDecoder.decodeObject(forKey: "thumb") as? String
         thumb2 = aDecoder.decodeObject(forKey: "thumb2") as? String
         totalLike = aDecoder.decodeObject(forKey: "totalLike") as? Int
         totalUser = aDecoder.decodeObject(forKey: "totalUser") as? Int
         tpl = aDecoder.decodeObject(forKey: "tpl") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? Int
         uid = aDecoder.decodeObject(forKey: "uid") as? Int
         users = aDecoder.decodeObject(forKey: "users") as? Int
         verify = aDecoder.decodeObject(forKey: "verify") as? Int
         vr = aDecoder.decodeObject(forKey: "vr") as? Int
         yyNum = aDecoder.decodeObject(forKey: "yyNum") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? [DanceData]
         head = aDecoder.decodeObject(forKey: "head") as? Int
         hideTag = aDecoder.decodeObject(forKey: "hideTag") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         pageable = aDecoder.decodeObject(forKey: "pageable") as? Int
         recommend = aDecoder.decodeObject(forKey: "recommend") as? Int
         serv = aDecoder.decodeObject(forKey: "serv") as? Int
         showImpress = aDecoder.decodeObject(forKey: "showImpress") as? Int
         tagType = aDecoder.decodeObject(forKey: "tagType") as? Int
         topContentBanner = aDecoder.decodeObject(forKey: "topContentBanner") as? Int
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if arGame != nil{
			aCoder.encode(arGame, forKey: "arGame")
		}
		if avatar != nil{
			aCoder.encode(avatar, forKey: "avatar")
		}
		if biz != nil{
			aCoder.encode(biz, forKey: "biz")
		}
		if desc != nil{
			aCoder.encode(desc, forKey: "desc")
		}
		if deviceType != nil{
			aCoder.encode(deviceType, forKey: "deviceType")
		}
		if distance != nil{
			aCoder.encode(distance, forKey: "distance")
		}
		if frameQa != nil{
			aCoder.encode(frameQa, forKey: "frameQa")
		}
		if gameStyle != nil{
			aCoder.encode(gameStyle, forKey: "gameStyle")
		}
		if groupId != nil{
			aCoder.encode(groupId, forKey: "groupId")
		}
		if img != nil{
			aCoder.encode(img, forKey: "img")
		}
		if linkMic != nil{
			aCoder.encode(linkMic, forKey: "linkMic")
		}
		if liveTime != nil{
			aCoder.encode(liveTime, forKey: "liveTime")
		}
		if logo != nil{
			aCoder.encode(logo, forKey: "logo")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if pid != nil{
			aCoder.encode(pid, forKey: "pid")
		}
		if quality != nil{
			aCoder.encode(quality, forKey: "quality")
		}
		if ru != nil{
			aCoder.encode(ru, forKey: "ru")
		}
		if scale != nil{
			aCoder.encode(scale, forKey: "scale")
		}
		if sid != nil{
			aCoder.encode(sid, forKey: "sid")
		}
		if site != nil{
			aCoder.encode(site, forKey: "site")
		}
		if snapshot != nil{
			aCoder.encode(snapshot, forKey: "snapshot")
		}
		if sort != nil{
			aCoder.encode(sort, forKey: "sort")
		}
		if srcVstreamType != nil{
			aCoder.encode(srcVstreamType, forKey: "srcVstreamType")
		}
		if ssid != nil{
			aCoder.encode(ssid, forKey: "ssid")
		}
		if startTime != nil{
			aCoder.encode(startTime, forKey: "startTime")
		}
		if tag != nil{
			aCoder.encode(tag, forKey: "tag")
		}
		if tagStyle != nil{
			aCoder.encode(tagStyle, forKey: "tagStyle")
		}
		if thumb != nil{
			aCoder.encode(thumb, forKey: "thumb")
		}
		if thumb2 != nil{
			aCoder.encode(thumb2, forKey: "thumb2")
		}
		if totalLike != nil{
			aCoder.encode(totalLike, forKey: "totalLike")
		}
		if totalUser != nil{
			aCoder.encode(totalUser, forKey: "totalUser")
		}
		if tpl != nil{
			aCoder.encode(tpl, forKey: "tpl")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if uid != nil{
			aCoder.encode(uid, forKey: "uid")
		}
		if users != nil{
			aCoder.encode(users, forKey: "users")
		}
		if verify != nil{
			aCoder.encode(verify, forKey: "verify")
		}
		if vr != nil{
			aCoder.encode(vr, forKey: "vr")
		}
		if yyNum != nil{
			aCoder.encode(yyNum, forKey: "yyNum")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if head != nil{
			aCoder.encode(head, forKey: "head")
		}
		if hideTag != nil{
			aCoder.encode(hideTag, forKey: "hideTag")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if pageable != nil{
			aCoder.encode(pageable, forKey: "pageable")
		}
		if recommend != nil{
			aCoder.encode(recommend, forKey: "recommend")
		}
		if serv != nil{
			aCoder.encode(serv, forKey: "serv")
		}
		if showImpress != nil{
			aCoder.encode(showImpress, forKey: "showImpress")
		}
		if tagType != nil{
			aCoder.encode(tagType, forKey: "tagType")
		}
		if topContentBanner != nil{
			aCoder.encode(topContentBanner, forKey: "topContentBanner")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
