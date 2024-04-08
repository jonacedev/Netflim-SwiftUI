//
//  ProfileModel.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 8/4/24.
//

import Foundation

struct ProfileModel: Hashable {
    let image: String
    let name: String
    
    static func getDefaultProfiles() -> [ProfileModel] {
        return [ProfileModel(image: "user1", name: "Jonace"),
                ProfileModel(image: "user2", name: "Laura"),
                ProfileModel(image: "user3", name: "Martin"),
                ProfileModel(image: "user4", name: "Paul"),
                ProfileModel(image: "user5", name: "Kids")]
    }
}
