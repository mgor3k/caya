//
//  Created by Maciej Górecki on 17/10/2021
//

import Foundation

class AppState: ObservableObject {
    @Published var route: Route = .onboarding
    
    init(preferences: Preferences) {
        if preferences.getCurrency() == nil {
            route = .onboarding
        } else {
            route = .home
        }
    }
}

extension AppState {
    enum Route {
        case onboarding
        case home
    }
}
