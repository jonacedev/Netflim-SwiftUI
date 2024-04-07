//
//  BaseSearchBar.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 2/4/24.
//

import SwiftUI

struct BaseSearchBar: View {
    
    @Binding var text: String
    var placeholder: String
    var size: CGFloat = 50 //Change the size
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField(placeholder, text: $text)
                .frame(height: size)
               
            if text != "" {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color(.systemGray3))
                    .onTapGesture {
                        withAnimation {
                            self.text = ""
                          }
                    }
            }
        }
        .padding(.horizontal, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 0.5)
        )
    }
}

#Preview {
    BaseSearchBar(text: .constant(""), placeholder: "search")
}
