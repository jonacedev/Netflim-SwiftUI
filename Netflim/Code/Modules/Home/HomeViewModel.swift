


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var popularModel: FilmModel?
    @Published var topRatedModel: FilmModel?
    @Published var upcomingModel: FilmModel?
    
    private let wireframe: HomeWireframe
    
    // MARK: - Init
    
    init(wireframe: HomeWireframe) {
        self.wireframe = wireframe
        super.init()
    }
    
    func onAppear() { }
    
    
    // MARK: - API
    
    @MainActor func getAllInfo() async {
        showLoading()
        popularModel = await self.getPopularMovies()
        topRatedModel = await self.getTopRatedMovies()
        upcomingModel = await self.getUpcomingMovies()
        hideLoading()
    }
    
    private func getPopularMovies() async -> FilmModel? {
        do {
            let response = try await api.getPopularMovies()
            return FilmModel(page: response.page, films: response.films, category: .popular)
        } catch {
            await manageError(error: error as? BaseError ?? .generic)
            return nil
        }
    }
    
    private func getTopRatedMovies() async -> FilmModel? {
        do {
            let response = try await api.getTopRatedMovies()
            return FilmModel(page: response.page, films: response.films, category: .topRated)
        } catch {
            await manageError(error: error as? BaseError ?? .generic)
            return nil
        }
    }
    
    private func getUpcomingMovies() async -> FilmModel? {
        do {
            let response = try await api.getUpcomingMovies()
            return FilmModel(page: response.page, films: response.films, category: .upcoming)
        } catch {
            await manageError(error: error as? BaseError ?? .generic)
            return nil
        }
    }
}
