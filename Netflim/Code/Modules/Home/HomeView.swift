
import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        ScrollView {
            VStack() {
            
                WebImage(url: viewModel.popularModel?.films?.last?.imageUrl())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 470)
                    .clipShape(RoundedCorner(radius: 8))
                    .overlay {
                        LinearGradient(gradient: Gradient(colors: [.clear, .clear, .clear, .black.opacity(0.2)]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                    }
                    .overlay(alignment: .bottom) {
                        HStack(spacing: 12) {
                            BaseButton(style: .secondary, text: "Reproducir", height: 40, action: {
                                
                            })
                            
                            BaseButton(style: .secondary, text: "Mi lista", height: 40, action: {
                                
                            })
                        }
                        .padding(.bottom, 12)
                        .padding(.horizontal, 12)
                    }
                
                VStack(spacing: 30) {
                    
                    if let popularFilms = viewModel.popularModel?.films {
                        GridHomeCell(title: "Popular movies", films: popularFilms)
                    }
                    
                    if let topRatedFilms = viewModel.topRatedModel?.films {
                        GridHomeCell(title: "Top Rated movies", films: topRatedFilms)
                    }
                    
                    if let upcomingFilms = viewModel.upcomingModel?.films {
                        GridHomeCell(title: "Upcoming", films: upcomingFilms)
                    }
                }
                .padding(.top, 20)
                
            }
            .task {
                await viewModel.getAllInfo()
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeWireframe(navigator: nil).preview()
}
