
import SwiftUI

struct NewHotView: View {
    
    @StateObject var viewModel: NewHotViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {
        Text("New Hot")
    }
}

#Preview {
    NewHotWireframe(navigator: nil).preview()
}
