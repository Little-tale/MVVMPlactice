//
//  URLSessionManager.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/25/24.
//

import Foundation


class URLSessionManager {
    private init() {}
    static let shared = URLSessionManager()
    
    func requestURL<T: Decodable>(type: T.Type){
        var urlComponents = URLComponents()
        urlComponents.scheme
        urlComponents.path
        urlComponents.query
        urlComponents.queryItems
        urlComponents.host
        
    }
    
    
}

/*
 let Url = URL(string: <#T##String#>)
 
 let URLRequest = URLRequest(url: <#T##URL#>)
 
 URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
 */
