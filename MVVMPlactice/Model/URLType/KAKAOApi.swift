//
//  KAKAOApi.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/25/24.
//

import Foundation


enum KAKAOApi: URLSessionType {
    case search(searchText: String, x:Double, y: Double)
    
    var scheme: String {
        switch self {
        case .search(let searchText, let x, let y):
            <#code#>
        }
    }
    
    var path: String
    
    var query: String
    
    var queryItems: [URLQueryItem]
    
    var host: String
    
    var allHeader: [String : String]
    
    
}
