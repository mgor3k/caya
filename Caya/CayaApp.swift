//
//  Created by Maciej Górecki on 09/10/2021.
//

import SwiftUI

@main
struct CayaApp: App {
    @StateObject private var state: AppState
    private let dependencies: Dependencies
    
    init() {
        let dependencies: Dependencies = .live
        
        self.dependencies = dependencies
        self._state = StateObject(
            wrappedValue: AppState(
                preferences: dependencies.preferences
            )
        )
    }
    
    var body: some Scene {
        WindowGroup {
            content
                .animation(.default, value: state.route)
        }
    }
}

private extension CayaApp {
    @ViewBuilder
    var content: some View {
        switch state.route {
        case .home:
            NavigationView {
                RootFeature(
                    dependencies: dependencies
                )
            }
        case .onboarding:
            OnboardingFeature(
                dependencies: dependencies,
                action: {
                    switch $0 {
                    case .finished:
                        state.showHome()
                    }
                }
            )
        }
    }
}
