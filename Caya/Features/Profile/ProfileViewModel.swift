//
//  Created by Maciej Górecki on 24/10/2021
//

import Foundation

class ProfileViewModel: ObservableObject {
    private let preferences: Preferences
    
    var currency: Currency? {
        if let code = preferences.currencyCode {
            return Currency(code: code)
        }
        return nil
    }
    
    init(preferences: Preferences) {
        self.preferences = preferences
    }
}
