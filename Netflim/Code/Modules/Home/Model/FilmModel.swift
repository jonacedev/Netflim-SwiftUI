//
//  FilmModel.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 8/4/24.
//

import Foundation

enum FilmCategory: Codable {
    case popular
    case topRated
}

struct FilmModel: Codable {
    let page: Int?
    let films: [Film]?
    let category: FilmCategory?
    
    private enum CodingKeys : String, CodingKey {
       case page, films = "results", category
   }
    
    init(page: Int?, films: [Film]?, category: FilmCategory?) {
        self.page = page
        self.films = films
        self.category = category
    }
}

struct Film: Codable {
    let id: Int
    let title: String?
    let original_title: String?
    let overview: String?
    let video: Bool?
    let vote_average: Double?
    let poster_path: String?
    let backdrop_path: String?
    let release_date: String?
    let genres: [Int]?
    let adult: Bool?
}
