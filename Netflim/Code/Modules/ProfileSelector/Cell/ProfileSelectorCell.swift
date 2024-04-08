//
//  ProfileSelectorCell.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 8/4/24.
//

import SwiftUI

struct ProfileSelectorCell: View {
    var userModel: ProfileModel?
    var onTapAction: () -> Void
    @State private var isAnimating: Bool = true
    @State private var tapAnimation: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            Image(userModel?.image ?? "")
                .resizable()
                .frame(width: 105, height: 105)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(userModel?.name ?? "")
                .font(.headline)
        }
        .onTapGesture {
            tapAnimation = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                tapAnimation = false
                onTapAction()
            })
          
        }
        .opacity(isAnimating || tapAnimation ? 0.4 : 1)
        .scaleEffect(isAnimating ? 1.2 : tapAnimation ? 0.98 : 1)
        .animation(.easeInOut(duration: 0.4), value: isAnimating)
        .onAppear {
           isAnimating = false
        }
    }
}

#Preview {
    ProfileSelectorCell(userModel: ProfileModel(image: "user1", name: "Default"), onTapAction: { })
}
