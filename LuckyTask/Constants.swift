//
//  Constants.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/30/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import UIKit

struct Constants {
    
    static let baseUrl = "http://dev.luckytrip.co.uk/api/2.0"
    
    struct storyboard {
        static var registration:UIStoryboard{
            get{ return  UIStoryboard(name: "Main", bundle: nil)}
        }
    }
    
    struct URLs {
        
        static var getCountries:String{
            get{ return  Constants.baseUrl + "content/countries"}
        }
        
        static var getAirports:String{
            get{ return  Constants.baseUrl + "search/airports"}
        }
        
    }
}
