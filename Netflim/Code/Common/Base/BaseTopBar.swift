//
//  BaseTopBar.swift
//
//  Created by Jonathan Miguel Onrubia Solis on 1/4/24.
//

import SwiftUI

struct BaseTopBar: View {

    struct Model {
        let text: String?
        var iconLeft: String? = "ic_back" //Default systemImage
        var iconRight: String?
        var back: (() -> Void)?
        var actionRight: (() -> Void)?
    }

    private let height: CGFloat = 44
    let model: Model

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    if let icon = model.iconLeft {
                        Button {
                            model.back?()
                        } label: {
                            Image(systemName: "chevron.left")
                                .renderingMode(.template)
                                .foregroundStyle(.black)
                        }
                    }
                    Spacer()
                    if let icon = model.iconRight {
                        Button(action: {
                            model.actionRight?()
                        }, label: {
                            Image(icon)
                        })
                    }
                }.padding()

                Text(model.text ?? "").font(.headline)

            }
            .frame(height: height)
            .foregroundStyle(.white)
            Spacer()
        }
    }
}

#Preview {
    BaseView(content: {
        BaseTopBar(model: BaseTopBar.Model(text: "Texto prueba", back: {}))
    }, vm: BaseViewModel())
}
