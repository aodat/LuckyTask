//
//  NetworkManager.swift
//  LuckyTask
//
//  Created by Abdalla Odat on 8/30/17.
//  Copyright © 2017 Abdalla Odat. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class NetworkManager: NSObject {
    
    enum FailReason {
        
        case noInternet
        case `protocol`(String)
        case unknown(String)
        
        var description: String {
            switch self {
            case .noInternet:
                return NSLocalizedString("NO_INTERNET_CONNECTION", comment: "")
            case .protocol(let details):
                return details
            case .unknown(let details):
                return details
            }
        }
    }
    
    enum Result {
        case success(Any)
        case fail(FailReason)
    }
    
    static func get(_ url: String, tag: String, params: [String: Any] = [:], _ completion: ((Result) -> Void)? ) {
        request(url, method: .get, parameters: params, headers: preparehttpHeaders())
            .responseJSON { (response: DataResponse<Any>) in
                processServerResponse(response, completion, tag)
                print(response)
        }
    }
    
    static func processServerResponse(_ response: DataResponse<Any>, _ completion: ((Result) -> Void)?, _ tag: String) {
        
        switch response.result {
            
        case .success:
            
            guard let root = response.result.value as? [String: Any] else {
                completion?(.fail(.protocol("Could not find JSON body response.")))
                return
            }
            
            guard let data = root[tag] as? Any else {
                completion?(.fail(.protocol("Could not find JSON body response.")))
                return
            }
            
            completion?(.success(data))
            
        case .failure:
            guard let error = response.result.error else {
                completion?(.fail(.unknown(response.result.description)))
                return
            }
            if NetworkManager.isNoInternetError(error) {
                completion?(.fail(.noInternet))
            } else {
                completion?(.fail(.unknown(error.localizedDescription)))
            }
        }
    }
    
    public static func isNoInternetError(_ error: Error) -> Bool {
        guard NSURLErrorDomain == error._domain else {
            return false
        }
        switch error._code {
        case NSURLErrorTimedOut:
            return true
        case NSURLErrorCannotFindHost:
            return true
        case NSURLErrorNetworkConnectionLost:
            return true
        case NSURLErrorNotConnectedToInternet:
            return true
        default:
            return false
        }
    }
    
    private static func preparehttpHeaders() -> [String: String] {
        
        let headers = ["Accept": "application/json"]
        return headers
    }
    
}
