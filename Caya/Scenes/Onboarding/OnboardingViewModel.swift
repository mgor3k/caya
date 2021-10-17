//
//  Created by Maciej Górecki on 17/10/2021
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var selection: String = "EUR"
    
    private let preferences: Preferences
    
    init(preferences: Preferences) {
        self.preferences = preferences
    }
    
    func storeSelection() {
        preferences.currencyCode = selection
    }
}
