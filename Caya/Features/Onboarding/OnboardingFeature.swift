//
//  Created by Maciej Gorecki on 12/11/2021
//

import SwiftUI

struct OnboardingFeature: View {
    let dependencies: Dependencies
    let action: (Action) -> Void
    
    var body: some View {
        OnboardingView {
            WelcomeView()
            CurrencyPickerView(
                store: .init(
                    preferences: dependencies.preferences,
                    currencyRepository: dependencies.currencies
                ),
                onNext: {
                    action(.finished)
                }
            )
        }
    }
}

extension OnboardingFeature {
    enum Action {
        case finished
    }
}
