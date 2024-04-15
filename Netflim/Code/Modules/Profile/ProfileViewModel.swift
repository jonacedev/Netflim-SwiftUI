


import Combine
import Foundation

final class ProfileViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: ProfileWireframe

    // MARK: - Init

    init(wireframe: ProfileWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() {
       //getAllInfo()
    }
}
