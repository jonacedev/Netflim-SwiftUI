
import SwiftUI

struct MainTabBarView: View {
    
    @StateObject var viewModel: MainTabBarViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }

    @ViewBuilder private func content() -> some View {

        ZStack(alignment: .bottom) {

            TabView(selection: $viewModel.tabSelection) {
                viewModel.vwHome
                    .tag(MainTabBarViewModel.TabSelection.home.rawValue)
                    .transition(.move(edge: .leading))
                    .environmentObject(viewModel)
                viewModel.vwNewHot
                    .tag(MainTabBarViewModel.TabSelection.newHot.rawValue)
                    .transition(.move(edge: .trailing))
                    .environmentObject(viewModel)
                viewModel.vwProfile
                    .tag(MainTabBarViewModel.TabSelection.profile.rawValue)
                    .transition(.move(edge: .trailing))
                    .environmentObject(viewModel)
            }
            
            tabBar()
        }
        .animation(.default, value: viewModel.tabSelection)
        .ignoresSafeArea(edges: .bottom)
            
    }

    @ViewBuilder private func tabBar() -> some View {
        BaseTabBar(tabSelected: $viewModel.tabSelection, items: [
            TabItem(text: "Home", image: "house.fill", isProfile: false),
            TabItem(text: "New & Hot".localized, image: "play.rectangle.on.rectangle", isProfile: false),
            TabItem(text: "My Netflix".localized, image: viewModel.user?.image ?? "user1", isProfile: true)
        ])
        .onAppear {
            viewModel.readyTab()
        }
    } 
}

#Preview {
    MainTabBarWireframe(navigator: nil).preview()
}
