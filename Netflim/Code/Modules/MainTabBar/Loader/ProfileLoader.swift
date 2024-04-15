//
//  ProfileLoader.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 16/4/24.
//

import SwiftUI

struct ProfileLoader: View {
    @State var isAnimating = true
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 70) {
                Image("user1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 170)
                    .clipShape(.rect(cornerRadius: 10))
                    .opacity(isAnimating ? 0.3 : 1)
                    .scaleEffect(isAnimating ? 0.85 : 1)
                    .animation(.easeInOut(duration: 0.3), value: isAnimating)
                
                CircleLoader()
                    .frame(width: 75, height: 75)
            }
        }
        .onAppear {
            isAnimating.toggle()
        }
    }
}

#Preview {
    ProfileLoader()
}
