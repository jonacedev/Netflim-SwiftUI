//
//  Enviroment.swift
//  TemplateMVVM
//
//  Created by Jonathan Onrubia Solis on 16/8/22.
//

import UIKit

final class Environment {

    // MARK: - Constant

    private let typeFileEnvironment = "plist"
    private let nameFileEnvironment = "Config"
    private let keyEnvironmentURL = "baseURL"
    private let keyEnvironmentToken = "baseToken"
  
    // MARK: - Shared Instance

    static let shared = Environment()

    // MARK: - Init
    
    private init() {
        if let path = Bundle.main.path(forResource: nameFileEnvironment, ofType: typeFileEnvironment) {
            plistEnvironment = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
        }
    }
    
    // MARK: - Properties
    // swiftlint:disable force_cast
    private var plistEnvironment: [String: Any]?

    var baseURL: String {
        return plistEnvironment?[keyEnvironmentURL] as! String
    }
    
    var baseToken: String {
        return plistEnvironment?[keyEnvironmentToken] as! String
    }
 
}
