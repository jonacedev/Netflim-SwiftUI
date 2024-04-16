


import Combine
import Foundation

final class ProfileSelectorViewModel: BaseViewModel {

    // MARK: - Properties

    private let wireframe: ProfileSelectorWireframe
    @Published var users: [ProfileModel] = []

    // MARK: - Init

    init(wireframe: ProfileSelectorWireframe) {
        self.wireframe = wireframe
        super.init()
    }

    // MARK: - Private Functions

    func onAppear() {
       getUsers()
    }
    
    func getUsers() {
        let defaultUsers = ProfileModel.getDefaultProfiles()
        defaultUsers.enumerated().forEach { idx, user in
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.2 * Double(idx) )) {
                self.users.append(user)
            }
        }
    }
    
    func goHome(userSelected: ProfileModel) {
        GlobalVariables.shared.userSelected = userSelected
        wireframe.goHome()
    }
}
