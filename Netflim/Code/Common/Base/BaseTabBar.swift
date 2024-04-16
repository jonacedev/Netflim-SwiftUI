//
//  BaseTabBar.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 15/4/24.
//

import SwiftUI

struct TabItem {
    let text, image: String
    let isProfile: Bool
}

struct BaseTabBar: View {

    @Binding var tabSelected: Int
    let items: [TabItem]
    private let height: CGFloat = max(UIApplication.safeArea.bottom, 16) + 20

    var body: some View {
       
        HStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) {idx, item in
                VStack(spacing: 3) {
                    if item.isProfile {
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 22)
                            .clipShape(.rect(cornerRadius: 4))
                    } else {
                        Image(systemName: item.image)
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                    }
                    
                    Text(item.text)
                        .font(.system(size: 10))
                }
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .foregroundStyle(tabSelected == idx ? .white : .gray.opacity(0.8))
                .onTapGesture {
                    tabSelected = idx
                }
            }
        }
        .frame(width: UIApplication.screenWidth, height: height)
        .clipShape(Capsule())
        .padding(.bottom, 25)
        .background {
            Rectangle()
                .fill(.thickMaterial)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BaseTabBar(tabSelected: Binding.constant(0), items: [
        TabItem(text: "Texto 1", image: "house.fill", isProfile: false),
        TabItem(text: "Texto 2", image: "play.rectangle.on.rectangle", isProfile: false),
        TabItem(text: "Texto 3", image: "user1", isProfile: true)])
}

