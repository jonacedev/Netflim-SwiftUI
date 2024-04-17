
import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject var parentViewModel: MainTabBarViewModel
    @State private var isTaskExecuted = false
    @State private var isToolbarOpaque = false
    
    var body: some View {
        BaseView(content: content, vm: viewModel)
    }
    
    @ViewBuilder private func content() -> some View {
        
        ScrollView {
            GeometryReader { geometry in
                Color.clear.preference(key: ViewOffsetKey.self, value: geometry.frame(in: .named("scrollView")).minY)
            }
            .frame(height: 0)
            
            VStack {
                headerSelector()
                bodyImage()
                filmsSections()
            }
            .onAppear {
                if !isTaskExecuted {
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
        .overlay(alignment: .top, content: {
            BaseTopBar(model: BaseTopBar.Model(text: "Para \(GlobalVariables.shared.userSelected?.name ?? "Username")", iconRight: "ic_stream", iconRight2: "ic_search"), height: 50, isOpaque: $isToolbarOpaque)
        })
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ViewOffsetKey.self) { value in
            isToolbarOpaque = value < 0
        }
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder private func headerSelector() -> some View {
        HStack {
            ChipCell(title: "Series", action: {
                
            })
            
            ChipCell(title: "Peliculas", action: {
                
            })
            
            ChipCell(title: "Categorias", image: "ic_arrow_down", action: {
                
            })
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.bottom)
        .padding(.top, 45)
    }
    
    @ViewBuilder private func bodyImage() -> some View {
        WebImage(url: viewModel.popularModel?.films?.last?.imageUrl())
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 470)
            .clipShape(RoundedCorner(radius: 8))
            .overlay {
                LinearGradient(gradient: Gradient(colors: [.clear, .clear, .clear, .black.opacity(0.3)]),
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
            .padding(.horizontal, 15)
    }
    
    @ViewBuilder private func filmsSections() -> some View {
        VStack(spacing: 30) {
            
            if let popularFilms = viewModel.popularModel?.films {
                FilmsCell(title: "Popular movies", films: popularFilms)
            }
            
            if let topRatedFilms = viewModel.topRatedModel?.films {
                FilmsCell(title: "Top Rated movies", films: topRatedFilms)
            }
            
            if let upcomingFilms = viewModel.upcomingModel?.films {
                FilmsCell(title: "Upcoming", films: upcomingFilms)
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 55)
    }
    
    // MARK: - Preference key to read the scroll view offset
    struct ViewOffsetKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value += nextValue()
        }
    }
}

#Preview {
    MainTabBarWireframe(navigator: nil).preview()
}
