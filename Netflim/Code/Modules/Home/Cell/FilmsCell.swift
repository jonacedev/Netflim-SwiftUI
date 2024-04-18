//
//  GridHomeCell.swift
//  Netflim
//
//  Created by Jonathan Miguel Onrubia Solis on 12/4/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FilmsCell: View {
    let title: String
    let films: [Film]
    let tapFilm: (Film) -> Void
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20).bold())
                .foregroundStyle(.white)
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(130))]) {
                    ForEach(films, id: \.id) { film in
                        if #available(iOS 17.0, *) {
                            WebImage(url: film.imageUrl())
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 170)
                                .clipShape(RoundedCorner(radius: 8))
                                .scrollTransition { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.6)
                                        .opacity(phase.isIdentity ? 1 : 0)
                                }
                                .onTapGesture {
                                    tapFilm(film)
                                }
                        } else {
                            WebImage(url: film.imageUrl())
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 170)
                                .clipShape(RoundedCorner(radius: 8))
                                .onTapGesture {
                                    tapFilm(film)
                                }
                        }
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
                            if #available(iOS 17.0, *) {
                                Image("default_poster")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 130, height: 180)
                                    .clipShape(RoundedCorner(radius: 8))
                                    .scrollTransition { content, phase in
                                        content
                                            .scaleEffect(phase.isIdentity ? 1 : 0.6)
                                            .opacity(phase.isIdentity ? 1 : 0)
                                    }
                            } else {
                                Image("default_poster")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 130, height: 180)
                                    .clipShape(RoundedCorner(radius: 8))
                            }
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
