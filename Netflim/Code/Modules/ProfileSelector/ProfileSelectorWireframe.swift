

import SwiftUI

final class ProfileSelectorWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: ProfileSelectorView {
        ProfileSelectorView(viewModel: self.viewModel)
    }
    
    private var viewModel: ProfileSelectorViewModel {
        return ProfileSelectorViewModel(wireframe: self)
    }
    
    internal override func viewController() -> ProfileSelectorViewController {
        return ProfileSelectorViewController(root: view)
    }

    final class ProfileSelectorViewController: BaseViewController <ProfileSelectorView> {
        init(root: ProfileSelectorView) {
            super.init(rootView: root)
        }

        deinit {print("\(String(describing: self)): Deinit called")}
        @objc required dynamic init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    }

    // MARK: - Public Functions
    
    func preview() -> some View {
        view
    }
    
    func present() {
        super.present(viewController: viewController())
    }
    
    func push() {
        super.push(viewController: viewController())
    }
    
    func goBack() {
        back()
    }
    
    func goHome() {
        MainTabBarWireframe(navigator: navigator).present()
    }
    
}


