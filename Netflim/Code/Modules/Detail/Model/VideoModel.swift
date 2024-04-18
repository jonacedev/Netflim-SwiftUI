//
//  VideoModel.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 18/4/24.
//

import Foundation

struct VideoModel: Codable {
    let id: Int?
    let results: [InfoVideo]?
    
    struct InfoVideo: Codable {
        let site: String?
        let key: String?
    }
}
