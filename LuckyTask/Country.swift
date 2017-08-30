//
//  Country.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/30/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import ObjectMapper

class Country: RootModel {
    
    var id: Int?
    var name: String?
    var countryCode: String?
    var currencyCode: String?
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
        currencyCode    <- map["currency_code"]
        thumbnailType   <- map["thumbnail.image_type"]
        thumbnailUrl    <- map["thumbnail.image_url"]
    }
}
