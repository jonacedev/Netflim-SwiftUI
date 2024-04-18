//
//  BaseTopBar.swift
//
//  Created by Jonathan Miguel Onrubia Solis on 1/4/24.
//

import SwiftUI

struct BaseTopBar: View {
    
    struct Model {
        let text: String?
        var iconRight: String?
        var iconRight2: String?
        var actionRight: (() -> Void)?
        var actionRight2: (() -> Void)?
    }
    
   
    let model: Model
    @State var height: CGFloat = 35
    @Binding var isOpaque: Bool
    
    var body: some View {
        
        VStack {
            HStack {
                Text(model.text ?? "").font(.system(size: 24).bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                if let icon = model.iconRight {
                    Button(action: {
                        model.actionRight?()
                    }, label: {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .tint(.white)
                            .frame(width: 28, height: 28)
                    })
                }
                
                if let icon = model.iconRight2 {
                    Button(action: {
                        model.actionRight2?()
                    }, label: {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .tint(.white)
                            .frame(width: 28, height: 28)
                    })
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: height)
        .background {
            if isOpaque {
                Rectangle()
                    .fill(.thinMaterial)
                    .ignoresSafeArea()
            } else {
                Color.clear
            }
           
        }
        
    }
}

#Preview {
    BaseView(content: {
        BaseTopBar(model: BaseTopBar.Model(text: "Texto prueba"), isOpaque: .constant(false))
    }, vm: BaseViewModel())
}
