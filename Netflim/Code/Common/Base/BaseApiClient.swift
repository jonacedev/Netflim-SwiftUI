//
//  BaseApiClient.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//


import Foundation

struct ApiError: Decodable {
    let success: Bool?
    let status_message: String?
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

class BaseApiClient {
    
    func request<T: Decodable>(path: String, method: HTTPMethod = .get, queryItems: [URLQueryItem]? = nil, parameters: [String: Any]? = nil, headers: [String: String]? = nil) async throws -> T {
        
        guard let baseUrl = URL(string: Environment.shared.baseURL), let absoluteURL = URL(string: baseUrl.appendingPathComponent(path).absoluteString.removingPercentEncoding ?? "") else {
            throw BaseError.generic
        }

        var urlComponents = URLComponents(url: absoluteURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method.rawValue
               
        
        // MARK: - Set parameters
        if method == .post, let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }
        
        // MARK: - Set headers
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
    
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw handleError(data: data)
        }
        
        if let response = try? JSONDecoder().decode(T.self, from: data) {
            return response
        } else {
            throw BaseError.generic
        }
    }
    
    private func handleError(data: Data) -> BaseError {
        if let apiError = try? JSONDecoder().decode(ApiError.self, from: data) {
            return BaseError.api(apiError)
        } else {
            return BaseError.generic
        }
    }
    
    
    // MARK: - For this app, the token that TMDB api give to us is always the same with a validation of 60 min, so we set a default header always.
    
    func setDefaultHeaders() -> [String: String] {
               
        let token = Environment.shared.baseToken
        let headers = [
            "content-type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
        
        return headers
    }
}
