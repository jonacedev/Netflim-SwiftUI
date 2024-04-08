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
    @State private var isAnimating: Bool = true
    
    var body: some View {
        VStack(spacing: 8) {
            Image(userModel.image)
                .resizable()
                .frame(width: 105, height: 105)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(userModel.name)
                .font(.headline)
        }
        .onTapGesture {
            onTapAction()
        }
        .scaleEffect(isAnimating ? 1.2 : 1)
        .animation(.easeInOut(duration: 0.5), value: isAnimating)
        .onAppear {
           isAnimating = false
        }
    }
}

#Preview {
    ProfileSelectorCell(userModel: ProfileModel(image: "user1", name: "Default"), onTapAction: { })
}
