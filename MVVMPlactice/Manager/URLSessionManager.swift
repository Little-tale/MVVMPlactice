//
//  URLSessionManager.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/25/24.
//

import Foundation

enum URLRequestError :Error {
    case cantChageUrl
    case cantChaneURLRequest
}

class URLSessionManager {
    private init() {}
    static let shared = URLSessionManager()
    
    func requestURL<T: Decodable>(type: T.Type,api: URLSessionType, pageNum: Int? = nil, complite: @escaping (T) -> Void){
        let urlRequests = makeUrlRequest(api, pageNum: pageNum)
        switch urlRequests {
        case .success(let success):
            errorCatch(urlRequest: success, type: type) { data in
                complite(data)
            }
        case .failure(let failure):
            print(failure)
        }
    }
    
    private func errorCatch<T:Decodable>(urlRequest: URLRequest, type: T.Type, coplite: @escaping (T) -> Void){
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: urlRequest) {
                data, response, error in
                guard error == nil else {
                    print("error 가 존재")
                    return
                }
                guard let data = data else {
                    print("데이터가 없음")
                    return
                }
                guard let response = response else {
                    print("응답이 없음")
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    print("응답코드 변경실패")
                    return
                }
                guard response.statusCode == 200 else {
                    print("응답코드 200이 아님")
                    return
                }
                do{
                    let results = try JSONDecoder().decode(type, from: data)
                    coplite(results)
                } catch {
                    print(error)
                    return
                }
            }.resume()
        }
    }
    
    private func makeUrlRequest(_ api: URLSessionType,pageNum: Int? = nil) -> Result<URLRequest, URLRequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = api.scheme
        urlComponents.path = api.path
        urlComponents.queryItems = api.queryItems
        urlComponents.host = api.host
        
        if let pageNum = pageNum {
            let urlQuery = URLQueryItem(name: "page", value: String(pageNum))
            urlComponents.queryItems?.append(urlQuery)
        }
        guard var urlRequest = changeUrl(urlComponents: urlComponents) else {
            print("url 변경 실패")
            return .failure(.cantChageUrl)
        }
        urlRequest.allHTTPHeaderFields = api.allHeader
        urlRequest.httpMethod = "GET"
        
        return .success(urlRequest)
    }

    private func changeUrl(urlComponents: URLComponents) -> URLRequest? {
        guard let url = urlComponents.url else {
            print("url 변경 실패")
            return nil
        }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
}




/*
 let Url = URL(string: <#T##String#>)
 
 let URLRequest = URLRequest(url: <#T##URL#>)
 
 URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
 */
