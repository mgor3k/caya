//
//  Created by Maciej Gorecki on 11/11/2021
//

import SwiftUI

struct HomeFeature: View {
    let dependencies: Dependencies
    let action: (Action) -> Void
    
    var body: some View {
        HomeView { page in
            switch page {
            case .home:
                HistoryView(
                    viewModel: .init(
                        repository: dependencies.repository,
                        preference: dependencies.preferences
                    ),
                    onAdd: {
                        action(.add)
                    },
                    onEdit: {
                        action(.edit($0))
                    }
                )
            case .profile:
                ProfileView(
                    viewModel: .init(
                        preferences: dependencies.preferences
                    ),
                    onRoute: {
                        action(.showProfile($0))
                    }
                )
            }
        }
    }
}
