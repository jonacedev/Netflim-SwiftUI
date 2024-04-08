
import SwiftUI

struct ProfileSelectorView: View {
    
    @StateObject var viewModel: ProfileSelectorViewModel
    @State private var users: [ProfileModel] = ProfileModel.getDefaultProfiles()
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack(spacing: 90) {
            Text("profile_selector_header_title".localized)
                .font(.system(size: 22).bold())
            
            VStack {
                LazyVGrid(columns: [GridItem(.fixed(115)), GridItem(.fixed(115))], spacing: 35) {
                    ForEach(0..<users.count, id: \.self) { idx in
                        ProfileSelectorCell(userModel: users[idx], onTapAction: {
                            viewModel.goHome()
                        })
                    }
                }
            }
            
            Spacer()
           
        }
    }
}

#Preview {
    ProfileSelectorWireframe(navigator: nil).preview()
}
