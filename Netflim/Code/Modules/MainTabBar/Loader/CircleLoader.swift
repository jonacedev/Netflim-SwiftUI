//
//  ProfileLoader.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 15/4/24.
//

import SwiftUI

struct CircleLoader: View {
    @State private var isSpinning: Bool = false
    var body: some View {
        Circle()
            .stroke(.linearGradient(colors: [
                .red,
                .red,
                .red,
                .red,
                .red.opacity(0.7),
                .red.opacity(0.4),
                .red.opacity(0.1),
                .clear
            ], startPoint: .top, endPoint: .bottom), lineWidth: 8)
            .rotationEffect(.init(degrees: isSpinning ? 360 : 0))
            .onAppear {
                withAnimation(.linear(duration: 0.7).repeatForever(autoreverses: false)) {
                    isSpinning = true
                }
            }
    }
}

#Preview {
    CircleLoader()
}
