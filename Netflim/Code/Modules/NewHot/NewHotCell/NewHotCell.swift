//
//  NewHotCell.swift
//  Netflim
//
//  Created by Mei De Blas on 16/4/24.
//

import SwiftUI

struct NewHotCell: View {
    var body: some View {
        HStack(alignment: .top){ //MARK: - Deja espacio entre todos los ")_{" tambien en los stacks VStack_{ }
            VStack{
                Text("ABR")
                    .font(.system(size: 25))
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                Text("26")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            } //MARK: - Espacio respecto al stack de abajo estaria god
            VStack { //MARK: - Cuando hay muchos elementos dentro de un stack deja saltos de linea en vez de dejarlo todo pegado para que se entienda mejor
                Image("default_poster")
                    .resizable()
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 200)
                    .clipped()
                HStack{
                    Image("image_title")
                        .resizable()
                        .scaledToFit() //MARK: -Puedes añadir un   .padding(.vertical, 10) para que no pegue con la imagen de arriba
                      
                    Spacer()
                    
                    //MARK: - Ya que tienes los botones crea en la carpeta Utils un boton custom para reutilzarlo aqui y en otras posibles vistas de forma que tambien no repetimos codigo innecesario. Descargate develop y creo que ahy algun ejemplo de como crear un componente custom al que le puedas pasar el titulo y una accion devuelta por closure.
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
                VStack (alignment: .leading, spacing: 0) { //MARK: - si usas spacing, que genera espacio entre todos los elementos que estan dentro del stack no abuses de paddings verticales, top, bottom en los hijos o vicerversa
                    Text("Estreno de la serie el 26 de abril")
                        .padding(.top, 20)
                    Image("netflix_icon_serie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .leading)
                    Text("El caso Asunta")
                        .fontWeight(.bold)
                        .padding(.top, 0) //MARK: - Un padding ".padding(.top, 0)" no hace nada porque el espacio que deja respecto arriba es 0
                        .font(.system(size: 20))
                    Text("Cuando un matrimonio denuncia la desaparición de su hija de 12 años, la investigación no tarda en volverse contra ellos. Basada en hechos reales.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        .frame(height: 80) //MARK: - Este frame genera espacio arriba y abajo inncesario, si queremos espacio podemos usar el padding top, bottom.. por lo general no le ponemos frame a textos
                    Text("Descarnada • Sombría • Misterio • Investigación • Española")
                        .frame(height: 40) //MARK: - Este frame genera espacio arriba y abajo inncesario, si queremos espacio podemos usar el padding top, bottom..
                        .font(.system(size: 12))
                }
                .frame(height: 200) //MARK: - Este frame limita igual que el de abajo del todo, podemos cargarnoslo
                .padding(0) //MARK: -  Padding 0 no hace nada, delete it
            }
        }
        .frame(height: 500) //MARK: - frame de 500 no nos interesa ya que si viene una peli con un text mas largo de lo normal no entrara el texto mejor que se reajuste solo, en netflix si que vienen por lo general textos de 4 lineas aunqeu hay alguno de 3 y se reajusta la celda mas pequeña, resumen *cargate el frame
    }
}

#Preview {
    NewHotCell()
}
