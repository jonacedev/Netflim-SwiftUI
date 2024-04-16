


import Combine
import Foundation

final class MainTabBarViewModel: BaseViewModel {

    // MARK: - Properties
    
    enum TabSelection: Int {
        case home = 0
        case newHot = 1
        case profile = 2
    }

    // MARK: - Properties

    private let wireframe: MainTabBarWireframe
    lazy var vwHome: HomeView = HomeWireframe(navigator: wireframe.navigator).view
    lazy var vwNewHot: NewHotView = NewHotWireframe(navigator: wireframe.navigator).view
    lazy var vwProfile: ProfileView = ProfileWireframe(navigator: wireframe.navigator).view
    
    // MARK: - Published

    @Published var tabSelection: Int = TabSelection.home.rawValue


    // MARK: - Init

    init(wireframe: MainTabBarWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() { }
    
    func readyTab() {
        tabSelection = tabSelection
    }
}

