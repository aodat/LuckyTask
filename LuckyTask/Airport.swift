//
//  Airport.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/30/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import ObjectMapper

class Airport: RootModel {
    
    var id: Int?
    var name: String?
    var countryCode: String?
    var latitude: String?
    var longitude: String?
    var thumbnailType: String?
    var thumbnailUrl: String?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
        mapping(map: map)
    }
    
    override func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        countryCode     <- map["country_code"]
        latitude        <- map["latitude"]
        longitude       <- map["longitude"]
        thumbnailType   <- map["thumbnail.image_type"]
        thumbnailUrl    <- map["thumbnail.image_url"]
    }
}
