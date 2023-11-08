//
//  Model.swift
//  WAC1
//
//  Created by Irine on 07/11/23.
//

import Foundation

struct MainData: Codable {
    let type: String?
    let data: [Category]
}

struct Category: Codable {
    let id: String?
    let image: String?
    let name:String?
}
struct BannerData: Hashable,Codable {
    let type: String?
    let data: [Banner]?
    
    enum codingKeys: String, CodingKey {
            case data
        }
}
struct Banner: Hashable, Codable {
    let id: String?
    let image: String?
}

