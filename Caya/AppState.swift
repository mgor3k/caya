//
//  Created by Maciej Górecki on 17/10/2021
//

import Foundation

class AppState: ObservableObject {
    @Published private(set) var route: Route = .onboarding
    
    init(preferences: Preferences) {
        if preferences.currencyCode == nil {
            route = .onboarding
        } else {
            route = .home
        }
    }
    
    func showHome() {
        route = .home
    }
}

extension AppState {
    enum Route {
        case onboarding
        case home
    }
}
