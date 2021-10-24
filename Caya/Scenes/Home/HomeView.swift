//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI
import FloatingBar

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    let onAdd: () -> Void
    let onProfileRoute: (ProfileRoute) -> Void
    
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: viewModel.selectedMenuItem.gradientPosition
            )
                .animation(.default, value: viewModel.selectedMenuItem)
                        
            switch viewModel.selectedMenuItem {
            case .home:
                list
                    .navigationTitle(viewModel.currency.formatted(viewModel.savings))
                    .toolbar {
                        Button(action: onAdd) {
                            Image(systemName: "plus.app.fill")
                        }
                        .foregroundColor(Color(uiColor: .label))
                    }
            case .profile:
                profile
                    .navigationTitle("Profile")
            }
            
            LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
                .frame(height: 150)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            
            FloatingBar(
                items: HomeMenuItem.allCases,
                selectedItem: $viewModel.selectedMenuItem
            )
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

private extension HomeView {
    var list: some View {
        HistoryView(
            sections: viewModel.sections,
            currency: viewModel.currency,
            onDelete: viewModel.deleteEntry
        )
    }
    
    var profile: some View {
        ProfileView(
            viewModel: .init(
                preferences: viewModel.preferences
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
        HomeView(
            viewModel: .init(
                provider: MockPersistanceManager(),
                preference: MockPreferences()
            ),
            onAdd: {},
            onProfileRoute: { _ in }
        )
            .environment(\.colorScheme, .dark)
    }
}
