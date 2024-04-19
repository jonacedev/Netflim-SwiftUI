
import Combine
import Foundation

final class NewHotViewModel: BaseViewModel {

    // MARK: - Properties

    @Published var popularModel: FilmModel?
    
    private let wireframe: NewHotWireframe

    
    // MARK: - Init

    init(wireframe: NewHotWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() {
       //getAllInfo()
    }
    
    
    // MARK: - Api
    
    @MainActor func getAllInfo(success: @escaping () -> Void) async {
        popularModel = await self.getPopularMovies()
        success()
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
}
