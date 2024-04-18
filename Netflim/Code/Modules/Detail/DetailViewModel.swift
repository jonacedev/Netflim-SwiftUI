


import Combine
import Foundation
import YouTubePlayerKit

final class DetailViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: DetailWireframe
    
    @Published var videoAvaiable: Bool = true
    @Published var youTubePlayer: YouTubePlayer?
    var film: Film

    // MARK: - Init

    init(wireframe: DetailWireframe, film: Film) {
        self.wireframe = wireframe
        self.film = film
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() { }
    
    @MainActor func getTrailer() async {
        do {
            let response = try await api.getTrailer(videoId: film.id)
            if let key = response.results?.filter({ $0.site?.lowercased() == "youtube" }).first?.key {
                let youtubeUrl = "https://www.youtube.com/watch?v=\(key)"
                self.youTubePlayer = YouTubePlayer(source: .url(youtubeUrl), configuration: .init(autoPlay: true, showControls: false, showFullscreenButton: false, showAnnotations: false, loopEnabled: true, showRelatedVideos: false))
            } else {
                self.videoAvaiable = false
            }
        } catch {
            manageError(error: error as? BaseError ?? .generic)
        }
    }
    
    func dismissModal() {
        wireframe.dismissModal()
    }
}
