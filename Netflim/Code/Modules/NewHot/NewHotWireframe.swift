

import SwiftUI

final class NewHotWireframe: BaseWireframe {

    // MARK: - Private Functions
    
    var view: NewHotView {
        NewHotView(viewModel: self.viewModel)
    }
    
    private var viewModel: NewHotViewModel {
        return NewHotViewModel(wireframe: self)
    }
    
    internal override func viewController() -> NewHotViewController {
        return NewHotViewController(root: view)
    }

    final class NewHotViewController: BaseViewController <NewHotView> {
        init(root: NewHotView) {
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


