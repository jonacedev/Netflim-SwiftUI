//
//  GlobalVariables.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 16/4/24.
//

import Foundation

final class GlobalVariables {
    static let shared = GlobalVariables()
    var userSelected: ProfileModel?
    
    func getUserSelected() -> ProfileModel {
        guard let userSelected else { return ProfileModel.getDefaultProfiles().first! }
        return userSelected
    }
}
