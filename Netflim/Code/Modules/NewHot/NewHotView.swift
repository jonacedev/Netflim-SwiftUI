
import SwiftUI
import SDWebImage

struct NewHotView: View {
    
    
    @StateObject var viewModel: NewHotViewModel
    @EnvironmentObject var parentViewModel: MainTabBarViewModel
    @State private var isTaskExecuted = false
    
    let hotNewsFilms: [filmDetailModel]
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        ScrollView {
            List{
                ForEach(hotNewsFilms, id: \.id) { film in
                    NewHotCell(id: film.id, title: film.title, description: film.description, videoUrl: , logoUrl: film.logoUrl, genres: film.genres.description, releaseDate: film.releaseDate)
            }
                
            .onAppear {
                if !isTaskExecuted {
                    parentViewModel.profileSelected = parentViewModel.user
                    parentViewModel.profileLoading = true
                    Task {
                        await viewModel.getAllInfo(success: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                parentViewModel.profileLoading = false
                                isTaskExecuted = true
                            })
                        })
                        
                    }
                }
                
            }
        }
        .scrollIndicators(.hidden)
    }
    
    
}

#Preview {
    NewHotWireframe(navigator: nil).preview()
}
