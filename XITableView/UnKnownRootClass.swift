//
//	UnKnownRootClass.swift
//
//	Create by bihu_Mac on 6/4/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class UnKnownRootClass : Mappable{

	var data : [UnKnownData]?
	var error : Int?

    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        data    <- map["data"]
        error   <- map["error"]
        
        
    }
}
