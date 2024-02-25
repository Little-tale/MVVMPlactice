//
//  KakaoModel.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/25/24.
//

import Foundation

// MARK: 카카오 로컬 검색
struct NaverGeo: Decodable {
    let documents: [Document]
    let meta: Meta
}


// MARK: - 도로명 주소 장소이름 전화번호 x,y lon lat
struct Document: Decodable {
    let phone, placeName: String
    let roadAddressName, x, y: String

    enum CodingKeys: String, CodingKey {
        case phone
        case placeName = "place_name"
        case roadAddressName = "road_address_name"
        case x, y
    }
}

// MARK: 토탈, 끝인지, 페이지수
struct Meta: Decodable {
    let isEnd: Bool
    let pageableCount: Int
    let totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
