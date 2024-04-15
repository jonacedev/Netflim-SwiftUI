


import Combine
import Foundation

final class NewHotViewModel: BaseViewModel {

    // MARK: - Properties

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
}
