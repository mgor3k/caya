//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI
import FloatingBar

struct HomeContainerView: View {
    @State var selectedMenuItem: HomeMenuItem = .home
    let onAdd: () -> Void
    let onProfileRoute: (ProfileRoute) -> Void
    
    @Environment(\.dependencies) private var dependencies
    
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: selectedMenuItem.gradientPosition
            )
                .animation(.default, value: selectedMenuItem)
                        
            switch selectedMenuItem {
            case .home:
                list
            case .profile:
                profile
            }
            
            LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
                .frame(height: 150)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            
            FloatingBar(
                items: HomeMenuItem.allCases,
                selectedItem: $selectedMenuItem
            )
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

private extension HomeContainerView {
    var list: some View {
        HistoryView(
            viewModel: .init(
                provider: dependencies.persistance,
                preference: dependencies.preferences
            ),
            onAdd: onAdd
        )
    }
    
    var profile: some View {
        ProfileView(
            viewModel: .init(
                preferences: dependencies.preferences
            ),
            onRoute: onProfileRoute
        )
    }
}

extension HomeMenuItem: FloatingBarItem {}

private extension HomeMenuItem {
    var gradientPosition: GradientBackgroundView.Position {
        switch self {
        case .home:
            return .leading
        case .profile:
            return .center
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContainerView(
            onAdd: {},
            onProfileRoute: { _ in }
        )
            .environment(\.colorScheme, .dark)
    }
}
