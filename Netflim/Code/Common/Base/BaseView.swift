//
//  BaseView.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation
import SwiftUI

struct BaseView<Content: View>: View {

    let content: () -> Content
    @StateObject var vm: BaseViewModel

    var body: some View {
        ZStack {
            content()
            alert()
            loader()
            profileLoader()
        }
        .onTapGesture {
              hideKeyboard()
        }
    }

    @ViewBuilder func alert() -> some View {
        if let alert = vm.alert {
            BaseAlert(model: alert)
        }
    }

    @ViewBuilder func loader() -> some View {
        if vm.loading == true {
            BaseLoader()
        }
    }
    
    @ViewBuilder func profileLoader() -> some View {
        if vm.profileLoading == true {
            ProfileLoader(user: vm.profileSelected)
        }
    }
}
