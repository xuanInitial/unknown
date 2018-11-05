//
//	DanceRootClass.swift
//
//	Create by bihu_Mac on 25/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class DanceRootClass : NSObject, NSCoding, Mappable{

	var code : Int?
	var data : [DanceData]?
	var message : String?


	class func newInstance(map: Map) -> Mappable?{
		return DanceRootClass()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		code <- map["code"]
		data <- map["data"]
		message <- map["message"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "code") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? [DanceData]
         message = aDecoder.decodeObject(forKey: "message") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "code")
		}
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}

	}

}
