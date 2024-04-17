//
//  NewHotCell.swift
//  Netflim
//
//  Created by Mei De Blas on 16/4/24.
//

import SwiftUI

struct NewHotCell: View {
    var body: some View {
        HStack(alignment: .top){
            VStack{
                Text("ABR")
                    .font(.system(size: 25))
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                Text("26")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            }
            VStack {
                Image("default_poster")
                    .resizable()
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 200)
                    .clipped()
                HStack{
                    Image("image_title")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Button(action: {
                        print("recuerdámelo pressed")
                    }, label: {
                        VStack{
                            Image(systemName: "bell.circle")
                            Text("recuérdamelo")
                                .font(.system(size: 10))
                        }.foregroundColor(.white)
                    })
                    Button(action: {
                        print("info. pressed")
                    }, label: {
                        VStack{
                            Image(systemName: "info.circle")
                            Text("Información")
                                .font(.system(size: 10))
                        }.foregroundColor(.white)
                    })
                }
                VStack (alignment: .leading, spacing: 0) {
                    Text("Estreno de la serie el 26 de abril")
                        .padding(.top, 20)
                    Image("netflix_icon_serie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .leading)
                    Text("El caso Asunta")
                        .fontWeight(.bold)
                        .padding(.top, 0)
                        .font(.system(size: 20))
                    Text("Cuando un matrimonio denuncia la desaparición de su hija de 12 años, la investigación no tarda en volverse contra ellos. Basada en hechos reales.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        .frame(height: 80)
                    Text("Descarnada • Sombría • Misterio • Investigación • Española")
                        .frame(height: 40)
                        .font(.system(size: 12))
                }
                .frame(height: 200)
                .padding(0)
            }
        }
        .frame(height: 500)
    }
}

#Preview {
    NewHotCell()
}
