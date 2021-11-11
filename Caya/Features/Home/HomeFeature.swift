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
                HistoryFeature(
                    dependencies: dependencies,
                    action: {
                        switch $0 {
                        case .new:
                            action(.add)
                        case let .edit(entry):
                            action(.edit(entry))
                        }
                    }
                )
            case .profile:
                ProfileFeature(
                    dependencies: dependencies,
                    action: {
                        action(.showProfile($0))
                    }
                )
            }
        }
    }
}

extension HomeFeature {
    enum Action {
        case add
        case edit(Entry)
        case showProfile(ProfileFeature.Action)
    }
}

extension HomeFeature {
    enum Page: CaseIterable {
        case home
        case profile
    }
}
