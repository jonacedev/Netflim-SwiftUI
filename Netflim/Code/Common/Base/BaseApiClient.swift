//
//  BaseApiClient.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import UIKit
import Alamofire
import Combine

class BaseAPIClient {

    private lazy var sesionManager = Session(configuration: URLSessionConfiguration.default)
    private var isReachable = true
    private let net = NetworkReachabilityManager()

    init() {
        startListenerReachability()
    }

    // MARK: - Public method

    func requestPublisher<T: Decodable>(path: String?,
                                        queryItems: [URLQueryItem]? = nil,
                                        method: HTTPMethod = .get,
                                        headers: HTTPHeaders? = nil,
                                        parameters: Parameters? = nil,
                                        encoding: ParameterEncoding = JSONEncoding.default,
                                        type: T.Type = T.self) -> AnyPublisher<T, BaseError> {

        let baseUrl = URL(string: Environment.shared.baseURL)!
        guard let absoluteURL = URL(string: baseUrl.appendingPathComponent(path!).absoluteString.removingPercentEncoding ?? "") else {
            return Fail(error: BaseError.generic).eraseToAnyPublisher()
        }

        var urlComponents = URLComponents(url: absoluteURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        
        let validStatusCode = [200, 300]
        print("\n-->> Request --->\n \(urlComponents)\n\(parameters?.convertToString() ?? "")")
        
        let headers: HTTPHeaders? = (headers == nil) ? setDefaultHeaders() : headers
        
        return sesionManager.request(urlComponents.url!, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: validStatusCode)
            .publishDecodable(type: T.self, emptyResponseCodes: [200, 204, 205])
            .tryMap { response in
                if let data =  response.data, let JSONString = String(data: data, encoding: .isoLatin2) {
                    print("\n-->> Response --->\n\(response.response.debugDescription)\n\(JSONString)")
                } else {
                    print("\n-->> Response --->\n ", response.response.debugDescription)
                }

                switch response.result {
                case let .success(result):
                    return result
                case let .failure(error):
                    throw error
                }
            }
            .mapError {[weak self] error in
                guard let self = self else { return .generic }
                return self.handler(error: error)
            }
            .eraseToAnyPublisher()
    }
    
    
    // MARK: - For this app, the token that TMDB api give to us is always the same with a validation of 60 min, so we set a default header always.
    
    func setDefaultHeaders() -> HTTPHeaders {
               
        let token = Environment.shared.baseToken
        var headers = [
            "content-type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
        
        return HTTPHeaders(headers.map { (key, value) in
            HTTPHeader(name: key, value: value)
        })
    }

    // MARK: - Private Method
    
    private func handler(error: Error?) -> BaseError {
        if isReachable == false { return .noInternetConnection }
        return .generic
    }

    private func startListenerReachability() {
        net?.startListening(onUpdatePerforming: {[weak self] status in
            self?.isReachable = status != .unknown && status != .notReachable
        })
    }
}
