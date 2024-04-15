

import SwiftUI

final class ProfileWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: ProfileView {
        ProfileView(viewModel: self.viewModel)
    }
    
    private var viewModel: ProfileViewModel {
        return ProfileViewModel(wireframe: self)
    }
    
    internal override func viewController() -> ProfileViewController {
        return ProfileViewController(root: view)
    }

    final class ProfileViewController: BaseViewController <ProfileView> {
        init(root: ProfileView) {
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
    
}


