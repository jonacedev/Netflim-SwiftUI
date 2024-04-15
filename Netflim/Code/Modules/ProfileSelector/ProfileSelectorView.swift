
import SwiftUI

struct ProfileSelectorView: View {
    
    @StateObject var viewModel: ProfileSelectorViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack(spacing: 90) {
            Text("profile_selector_header_title".localized)
                .font(.system(size: 22).bold())
            
            VStack {
                LazyVGrid(columns: [GridItem(.fixed(115)), GridItem(.fixed(115))], spacing: 35) {
                    ForEach(viewModel.users, id: \.self) { user in
                        ProfileSelectorCell(userModel: user, onTapAction: {
                            viewModel.goHome(user: user)
                        })
                        .transition(.move(edge: .bottom))
                    }
                }
            }
            
            Spacer()
           
        }
        .padding(.top, 20)
        .onAppear {
            viewModel.getUsers()
        }
    }
}

#Preview {
    ProfileSelectorWireframe(navigator: nil).preview()
}
