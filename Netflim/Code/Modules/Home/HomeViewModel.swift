


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var filmsGlobalModel: [FilmModel] = []
    let group = DispatchGroup()
    
    private let wireframe: HomeWireframe
    
    // MARK: - Init
    
    init(wireframe: HomeWireframe) {
        self.wireframe = wireframe
        super.init()
    }
    
    func onAppear() {
        getAllInfo()
    }

    
    func getAllInfo() {
        showLoading()
        getPopularMovies()
        getTopRatedMovies()
        finishRequest()
    }
    
    // MARK: - Private Functions
    
    private func getPopularMovies() {
        group.enter()
        ApiClient.shared.getPopularMovies().sink {[weak self] completion in
            guard let self = self else { return }
            if completion != .finished {
                self.manage(completion: completion, wireframe: self.wireframe)
            }
            self.group.leave()
        } receiveValue: {[weak self] response in
            guard let self = self else { return }
            let popularModel = FilmModel(page: response.page, films: response.films, category: .popular)
            self.filmsGlobalModel.append(popularModel)
        }.store(in: &cancellables)
    }
    
    private func getTopRatedMovies() {
        group.enter()
        ApiClient.shared.getTopRatedMovies().sink {[weak self] completion in
            guard let self = self else { return }
            if completion != .finished {
                self.manage(completion: completion, wireframe: self.wireframe)
            }
            self.group.leave()
        } receiveValue: {[weak self] response in
            guard let self = self else { return }
            let topRatedModel = FilmModel(page: response.page, films: response.films, category: .topRated)
            self.filmsGlobalModel.append(topRatedModel)
        }.store(in: &cancellables)
    }
    
    private func finishRequest() {
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
        }
    }
}
