//
//  smallPredefinedButton.swift
//  Netflim
//
//  Created by Mei De Blas on 18/4/24.
//

import SwiftUI

struct smallPredefinedButton: View {
    var body: some View {
        Button(action: {
            print("recuerdámelo pressed")
        }, label: {
            VStack{
                Image(systemName: "bell.circle")
                Text("recuérdamelo")
                    .font(.system(size: 10))
            }.foregroundColor(.white)
        })
    }
}

#Preview {
    smallPredefinedButton()
}
