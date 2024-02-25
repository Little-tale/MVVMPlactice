//
//  URLType.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/25/24.
//

import Foundation

protocol URLSessionType {
    var scheme: String {get}
    var path: String {get}
    var queryItems: [URLQueryItem] {get}
    var host: String {get}
    var allHeader: [String : String] {get}
}

