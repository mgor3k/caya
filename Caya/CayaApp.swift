//
//  Created by Maciej Górecki on 09/10/2021.
//

import SwiftUI

@main
struct CayaApp: App {
    @StateObject var state = AppState()
    
    var body: some Scene {
        WindowGroup {
            switch state.route {
            case .home:
                HomeCoordinator()
            case .onboarding:
                OnboardingView()
            }
        }
    }
}
