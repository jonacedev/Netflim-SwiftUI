
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Text(viewModel.filmsGlobalModel.first?.films?.first?.title ?? "")
        }
        .task {
            await viewModel.getMovies()
        }
    }
}

#Preview {
    HomeWireframe(navigator: nil).preview()
}
