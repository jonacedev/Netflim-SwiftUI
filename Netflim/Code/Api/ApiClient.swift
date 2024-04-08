//
//  PokeApi.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Alamofire
import Combine
import Foundation

final class ApiClient: BaseAPIClient {
    
    // MARK: - Shared Instance
    
    static let shared = ApiClient()
    
    // MARK: - Public Functions
    
    func getPopularMovies() -> AnyPublisher<FilmModel, BaseError> {
        
        let path = "movie/popular?language=es-ES&page=1"
        let queryItems = [URLQueryItem(name: "language", value: "es-ES"), URLQueryItem(name: "page", value: "1"), URLQueryItem(name: "include_video", value: "true")]
      
        return requestPublisher(path: path,
                                queryItems: queryItems,
                                method: .get,
                                encoding: JSONEncoding.default,
                                type: FilmModel.self)
    }
    
    func getTopRatedMovies() -> AnyPublisher<FilmModel, BaseError> {
      
        let path = "movie/top_rated"
        let queryItems = [URLQueryItem(name: "language", value: "es-ES"), URLQueryItem(name: "page", value: "1"), URLQueryItem(name: "include_video", value: "true")]
        
        return requestPublisher(path: path,
                                queryItems: queryItems,
                                method: .get,
                                encoding: JSONEncoding.default,
                                type: FilmModel.self)
    }

}
