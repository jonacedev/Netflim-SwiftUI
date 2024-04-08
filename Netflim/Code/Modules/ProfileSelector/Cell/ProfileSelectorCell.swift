//
//  ProfileSelectorCell.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 8/4/24.
//

import SwiftUI

struct ProfileSelectorCell: View {
    var userModel: ProfileModel
    var onTapAction: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Image(userModel.image)
                .resizable()
                .frame(width: 110, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(userModel.name)
                .font(.headline)
        }
        .onTapGesture {
            onTapAction()
        }
    }
}

#Preview {
    ProfileSelectorCell(userModel: ProfileModel(image: "user1", name: "Default"), onTapAction: { })
}
