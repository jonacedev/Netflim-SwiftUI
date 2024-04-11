


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var filmsGlobalModel: [FilmModel] = []
    var popularModel: FilmModel?
    var topRatedModel: FilmModel?
    var upcomingModel: FilmModel?
    
    private let wireframe: HomeWireframe
    
    // MARK: - Init
    
    init(wireframe: HomeWireframe) {
        self.wireframe = wireframe
        super.init()
    }
    
    func onAppear() { }
    
    @MainActor func getAllInfo() async {
        await self.getPopularMovies()
        await self.getTopRatedMovies()
        await self.getUpcomingMovies()
        
        [popularModel, topRatedModel, upcomingModel].compactMap{$0}.forEach {
            filmsGlobalModel.append($0)
        }
        
    }
    
    private func getPopularMovies() async {
        do {
            let response = try await api.getPopularMovies()
            self.popularModel = FilmModel(page: response.page, films: response.films, category: .popular)
            print(response)
        } catch {
            print(error)
            await manageError(error: error as? BaseError ?? .generic)
        }
    }
    
    private func getTopRatedMovies() async {
        do {
            let response = try await api.getTopRatedMovies()
            self.topRatedModel = FilmModel(page: response.page, films: response.films, category: .topRated)
        } catch {
            await manageError(error: error as? BaseError ?? .generic)
        }
    }
    
    private func getUpcomingMovies() async {
        do {
            let response = try await api.getUpcomingMovies()
            self.upcomingModel = FilmModel(page: response.page, films: response.films, category: .upcoming)
        } catch {
            await manageError(error: error as? BaseError ?? .generic)
        }
    }
}
