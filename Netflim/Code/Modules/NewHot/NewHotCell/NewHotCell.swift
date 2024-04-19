//
//  NewHotCell.swift
//  Netflim
//
//  Created by Mei De Blas on 16/4/24.
//

import SwiftUI

struct NewHotCell: View {
 
    let title: String
    let description: String
    let videoUrl: String
    let logoUrl: String
    let genres: String
    let releaseDateDay: String
    let releaseDateMonth: String

    var body: some View {
        HStack(alignment: .top){
            
            VStack {
                Text(releaseDateMonth)
                    .font(.system(size: 25))
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                Text(releaseDateDay)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            }
            
            VStack {
                
                Image("default_poster")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 200) //me sale warning de Invalid frame dimension (negative or non-finite). ver qué es
                    .clipped()
                
                HStack {
                    Image("image_title")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 20)
                    
                    Spacer()
                    
                    smallPredefinedButton(imageName: "info.circle", title: "information")
                    
                    smallPredefinedButton(imageName: "bell", title: "remember me")
                }
                
                VStack (alignment: .leading, spacing: 0) {
                    Text("Estreno de la serie el \(releaseDateDay) de \(releaseDateMonth)")
                    
                    Image("netflix_icon_serie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .leading)
                    
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    Text("Cuando un matrimonio denuncia la desaparición de su hija de 12 años, la investigación no tarda en volverse contra ellos. Basada en hechos reales.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.vertical, 10)
                        .frame(height: 80) // sé que frame limita pero no si no se me pone solo en una línea
                        

                    Text(genres)
                        .font(.system(size: 12))
                }
            }
        }
    }
}
    #Preview {
        NewHotCell(title: "Amadeus", description: "Wolfgang Amadeus Mozart is a remarkably talented young Viennese composer who unwittingly finds a fierce rival in the disciplined and determined Antonio Salieri. Resenting Mozart for both his hedonistic lifestyle and his undeniable talent, the highly religious Salieri is gradually consumed by his jealousy and becomes obsessed with Mozart's downfall, leading to a devious scheme that has dire consequences for both men.", videoUrl: "", logoUrl: "", genres: "History, Music, Drama", releaseDateDay: "08", releaseDateMonth: "Abril")
    }
