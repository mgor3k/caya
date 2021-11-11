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
                HomeCoordinator(dependencies: dependencies)
            }
        case .onboarding:
            OnboardingView(
                viewModel: .init(preferences: dependencies.preferences),
                onCompleted: state.showHome
            )
        }
    }
}
