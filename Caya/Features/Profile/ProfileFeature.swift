//
//  Created by Maciej Gorecki on 11/11/2021
//

import SwiftUI

struct ProfileFeature: View {
    let dependencies: Dependencies
    let action: (Action) -> Void
    
    var body: some View {
        ProfileView(
            store: .init(
                preferences: dependencies.preferences
            ),
            onCredits: {
                action(.credits)
            }
        )
    }
}

extension ProfileFeature {
    enum Action {
        case credits
    }
}
