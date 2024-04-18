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
            
            VStack{  //MARK: - Deja espacio despues de un "Stack_{"
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
                    //MARK: - Espacio out
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 200)
                    .clipped()
                
                HStack{ //MARK: - Deja espacio despues de un "Stack_{"
                    Image("image_title")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 20)
                    Spacer()
                    
                    smallPredefinedButton()
                    
                    smallPredefinedButton()
                    
                } //MARK: - Deja salto de linea"
                VStack (alignment: .leading, spacing: 0) {  //MARK: - No dejes espacio depues del Vstack_() cuando son parentesis"
                    Text("Estreno de la serie el 26 de abril")
                    
                    Image("netflix_icon_serie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .leading)
                    
                    Text("El caso Asunta")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    
                    Text("Cuando un matrimonio denuncia la desaparición de su hija de 12 años, la investigación no tarda en volverse contra ellos. Basada en hechos reales.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        //MARK: - Usa padding(.vertical, 10) y resumes el .bottom & .top en una linea"
                     
                    Text("Descarnada • Sombría • Misterio • Investigación • Española")
                        .font(.system(size: 12))
                }
            }
        }
    }
}

#Preview {
    NewHotCell()
}
