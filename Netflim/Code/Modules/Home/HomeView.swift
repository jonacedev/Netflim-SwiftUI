
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
           Text("Hola mundo")
        }
        .onAppear() {
            viewModel.onAppear()
        }
    }
}

#Preview {
    HomeWireframe(navigator: nil).preview()
}
