//
//  GridHomeCell.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 12/4/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct GridHomeCell: View {
    let title: String
    let films: [Film]
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20).bold())
                .foregroundStyle(.white)
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(130))]) {
                    ForEach(films, id: \.id) { film in
                        WebImage(url: film.imageUrl())
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 180)
                            .clipShape(RoundedCorner(radius: 8))
                    }
                }
                .padding(.horizontal, 5)
            }
            .scrollIndicators(.hidden)
        }
        .frame(minHeight: 180)
    }
}

#Preview {
    struct GridHomeCellPreview: View {
        let title = "default"
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20).bold())
                    .foregroundStyle(.white)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.fixed(130))]) {
                        ForEach(0..<5) { _ in
                           Image("default_poster")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 180)
                                .clipShape(RoundedCorner(radius: 8))
                        }
                    }
                    .padding(.horizontal, 5)
                }
                .scrollIndicators(.hidden)
            }
            .frame(minHeight: 180)
        }
    }
    
    return GridHomeCellPreview()
}
