//
//  smallPredefinedButton.swift
//  Netflim
//
//  Created by Mei De Blas on 18/4/24.
//

import SwiftUI

struct smallPredefinedButton: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        Button(action: {
            print("recuerdámelo pressed")
        }, label: {
            VStack{
                Image(systemName: "\(imageName)")
                Text("\(title)")
                    .font(.system(size: 10))
            }.foregroundColor(.white)
        })
    }
}

#Preview {
    smallPredefinedButton(imageName: "info.circle", title: "information")
}
