//
//  KAKAOApi.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/25/24.
//

import Foundation


enum KAKAOApi: URLSessionType {
    case search(searchText: String, x: String, y: String)
    
    var scheme: String {
        return "https"
    }
    
    var path: String {
        switch self{
        case .search:
            return "/v2/local/search/keyword"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let searchText, let x, let y):
            let searchItem = URLQueryItem(name: "query", value: searchText)
            let lat = URLQueryItem(name: "x", value: x)
            let long = URLQueryItem(name: "y", value: y)
            let redius = URLQueryItem(name: "redius", value: "150")
            return [searchItem,lat,long,redius]
        }
    }
    
    var host: String {
        switch self {
        case .search:
            return "dapi.kakao.com"
        }
    }
    
    var allHeader: [String : String] {
        return APIKey.KAKAO.headers
    }
    
    
}
