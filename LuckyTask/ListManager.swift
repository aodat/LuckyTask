//
//  UserManager.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/30/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import UIKit
import ObjectMapper

class ListManager {
    
    class func getCountries(completeion: ((Bool , String? , [Country]? ) -> Void)?)  {
        let url = Constants.URLs.getCountries
        let tag = "countries"
        NetworkManager.get(url,tag: tag ) { ( result) in
            
            switch result {
            case .success(let resultRoot):
                
                guard let result = resultRoot as? [Any] else {
                    completeion?(false , "No 'resultRoot' field.", nil)
                    return
                }
                
                DispatchQueue.global(qos: .background).async {
                    guard let countries = Mapper<Country>().mapArray(JSONObject: result) else {
                        DispatchQueue.main.async {
                            completeion?(false, "Failed to map response into objects.", nil)
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        completeion?(true, nil , countries)
                    }
                }
                
            case .fail(let reason):
                completeion?(false , reason.description, nil)
            }
        }
    }
    
    class func getAirports(completeion: ((Bool , String? , [Airport]? ) -> Void)?)  {
        let url = Constants.URLs.getAirports
        let tag = "airports"
        NetworkManager.get(url,tag: tag ) { ( result) in
            
            switch result {
            case .success(let resultRoot):
                
                guard let result = resultRoot as? [Any] else {
                    completeion?(false , "No 'resultRoot' field.", nil)
                    return
                }
                
                DispatchQueue.global(qos: .background).async {
                    guard let airports = Mapper<Airport>().mapArray(JSONObject: result) else {
                        DispatchQueue.main.async {
                            completeion?(false, "Failed to map response into objects.", nil)
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        completeion?(true, nil , airports)
                    }
                }
                
            case .fail(let reason):
                completeion?(false , reason.description, nil)
            }
        }
    }

}
