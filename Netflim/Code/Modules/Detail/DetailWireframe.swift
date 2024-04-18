

import SwiftUI

final class DetailWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    private func view(film: Film) -> DetailView {
        DetailView(viewModel: self.viewModel(film: film))
    }
    
    private func viewModel(film: Film) -> DetailViewModel {
        return DetailViewModel(wireframe: self, film: film)
    }
    
    func viewController(film: Film) -> DetailViewController {
        return DetailViewController(root: view(film: film))
    }

    final class DetailViewController: BaseViewController <DetailView> {
        init(root: DetailView) {
            super.init(rootView: root)
        }

        deinit {print("\(String(describing: self)): Deinit called")}
        @objc required dynamic init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view(film: Film(id: 693134, title: "", original_title: "", overview: "", video: false, vote_average: 0, poster_path: "", backdrop_path: "", release_date: "", genres: [], adult: false))
    }
    
    func presentModal(film: Film) {
        super.presentModal(viewController: viewController(film: film))
    }
    
    func dismiss() {
        super.dismissModal()
    }
    
    func goBack() {
        back()
    }
    
}


