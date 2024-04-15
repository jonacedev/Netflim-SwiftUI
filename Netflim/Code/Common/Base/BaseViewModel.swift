//
//  BaseViewModel.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Combine
import UIKit

class BaseViewModel: ObservableObject {

    // MARK: - Properties

    var cancellables = Set<AnyCancellable>()
    var userDefaults = UserDefaultsCache()
    let api = ApiClient.shared
    
    @Published var alert: BaseAlert.Model?
    @Published var loading: Bool?
    @Published var profileLoading: Bool?
    @Published var profileSelected: ProfileModel?

    @MainActor func manageError(error: BaseError, wireframe: BaseWireframe? = nil) {
        hideLoading()
       
        var action: () -> Void

        action = {[weak self] in
            self?.alert = nil
        }
        
        alert = BaseAlert.Model(image: error.errorDescription().icon,
                                title: error.errorDescription().title,
                                description: error.errorDescription().description,
                                buttonText1: error.errorDescription().button1,
                                feedback: .error,
                                action1: action)
    }

    func showLoading() {
        loading = true
    }

    func hideLoading() {
        loading = false
    }
    
}

