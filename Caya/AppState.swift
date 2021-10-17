//
//  Created by Maciej Górecki on 17/10/2021
//

import Foundation

class AppState: ObservableObject {
    @Published var route: Route = .onboarding
    
    init() {
        // TODO: Check if first open
    }
}

extension AppState {
    enum Route {
        case onboarding
        case home
    }
}
