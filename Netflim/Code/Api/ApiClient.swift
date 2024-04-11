//
//  PokeApi.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Alamofire
import Combine
import Foundation

final class ApiClient: BaseApiClient {
    
    // MARK: - Shared Instance
    
    static let shared = ApiClient()
    
    // MARK: - Public Functions
    
    func getPopularMovies() async throws -> FilmModel {
        
        let path = "movie/popular"
        let queryItems = [URLQueryItem(name: "language", value: "es-ES"), URLQueryItem(name: "page", value: "1"), URLQueryItem(name: "include_video", value: "true")]
        let headers = setDefaultHeaders()
        
        return try await request(path: path, method: .get, queryItems: queryItems, headers: headers)
    }
    
    func getTopRatedMovies() async throws -> FilmModel {
        
        let path = "movie/top_rated"
        let queryItems = [URLQueryItem(name: "language", value: "es-ES"), URLQueryItem(name: "page", value: "1"), URLQueryItem(name: "include_video", value: "true")]
        let headers = setDefaultHeaders()
        
        return try await request(path: path, method: .get, queryItems: queryItems, headers: headers)
    }
    
}
