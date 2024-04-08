
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        Text("Hola mundo")
    }
}

#Preview {
    HomeWireframe(navigator: nil).preview()
}
