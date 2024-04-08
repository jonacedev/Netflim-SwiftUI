


import Combine
import Foundation

final class ProfileSelectorViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: ProfileSelectorWireframe

    // MARK: - Init

    init(wireframe: ProfileSelectorWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() {
       //getAllInfo()
    }
    
    func goHome() {
        wireframe.goHome()
    }
}
