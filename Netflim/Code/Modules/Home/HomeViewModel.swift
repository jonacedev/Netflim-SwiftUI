


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var filmsGlobalModel: [FilmModel] = []
    var popularModel: FilmModel?
    var topRatedModel: FilmModel?
    
    private let wireframe: HomeWireframe
    
    // MARK: - Init
    
    init(wireframe: HomeWireframe) {
        self.wireframe = wireframe
        super.init()
    }
    
    func onAppear() { }
    
    @MainActor func getMovies() async {
        
        await self.getPopularMovies()
        await self.getTopRatedMovies()
        
        [popularModel, topRatedModel].compactMap{$0}.forEach {
            filmsGlobalModel.append($0)
        }
        
    }
    
    private func getPopularMovies() async {
        do {
            let response = try await ApiClient.shared.getPopularMovies()
            self.popularModel = FilmModel(page: response.page, films: response.films, category: .popular)
        } catch {
            await manageError(error: error as? BaseError ?? .generic)
        }
    }
    
    private func getTopRatedMovies() async {
        do {
            let response = try await ApiClient.shared.getTopRatedMovies()
            self.topRatedModel = FilmModel(page: response.page, films: response.films, category: .topRated)
        } catch {
            await manageError(error: error as? BaseError ?? .generic)
        }
    }
}
