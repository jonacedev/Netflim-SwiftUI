//
//  ChipCell.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 17/4/24.
//

import SwiftUI

struct ChipCell: View {
    var title: String
    var tintColor: Color = .white
    var strokeColor: Color = .gray
    var image: String? = nil
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.semibold)
            if let image {
                Image(image)
                    .resizable()
                    .frame(width: 18, height: 20)
            }
           
        })
        .frame(height: 35)
        .foregroundStyle(tintColor)
        .padding(.horizontal, 15)
        .background {
            RoundedCorner()
                .stroke(strokeColor, lineWidth: 0.8)
        }
    }
}

#Preview {
    MainTabBarWireframe(navigator: nil).preview()
}
