
import SwiftUI

struct ProfileSelectorView: View {
    
    @StateObject var viewModel: ProfileSelectorViewModel
    @State private var users: [ProfileModel] = ProfileModel.getDefaultProfiles()
    @State private var isAnimating: Bool = true
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            LazyVGrid(columns: [GridItem(.fixed(120)), GridItem(.fixed(120))], spacing: 35) {
                ForEach(0..<users.count, id: \.self) { idx in
                    ProfileSelectorCell(userModel: users[idx], onTapAction: {
                        viewModel.goHome()
                    })
                }
            }
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ProfileSelectorWireframe(navigator: nil).preview()
}
