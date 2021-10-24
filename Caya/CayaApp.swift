//
//  Created by Maciej Górecki on 09/10/2021.
//

import SwiftUI

@main
struct CayaApp: App {
    @StateObject var state: AppState
    
    let dependencies: DependencyManager
    
    init() {
        let dependencies = DependencyManager()
        
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
                .environment(\.dependencies, dependencies)
        }
    }
}

private extension CayaApp {
    @ViewBuilder
    var content: some View {
        switch state.route {
        case .home:
            NavigationView {
                HomeCoordinator()
            }
        case .onboarding:
            OnboardingView(
                viewModel: .init(preferences: dependencies.preferences),
                onCompleted: state.showHome
            )
        }
    }
}
