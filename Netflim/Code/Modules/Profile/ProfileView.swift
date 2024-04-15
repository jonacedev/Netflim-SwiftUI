
import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        Text("Hola mundo")
    }
}

#Preview {
    ProfileWireframe(navigator: nil).preview()
}
