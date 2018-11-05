//
//	HomeNewClass.swift
//
//	Create by ydz on 1/9/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeNewClass : NSObject, NSCoding, Mappable{

//	var productList : [HomeProductList]?
	var result : Bool?
	var status : String?
	var totalSize : Int?


	class func newInstance(map: Map) -> Mappable?{
		return HomeNewClass()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
	//	productList <- map["productList"]
		result <- map["result"]
		status <- map["status"]
		totalSize <- map["totalSize"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
       //  productList = aDecoder.decodeObject(forKey: "productList") as? [HomeProductList]
         result = aDecoder.decodeObject(forKey: "result") as? Bool
         status = aDecoder.decodeObject(forKey: "status") as? String
         totalSize = aDecoder.decodeObject(forKey: "totalSize") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
//        if productList != nil{
//            aCoder.encode(productList, forKey: "productList")
//        }
		if result != nil{
			aCoder.encode(result, forKey: "result")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if totalSize != nil{
			aCoder.encode(totalSize, forKey: "totalSize")
		}

	}

}
