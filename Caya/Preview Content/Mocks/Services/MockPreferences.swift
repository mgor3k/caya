//
//  Created by Maciej Górecki on 16/10/2021
//

import Foundation

struct MockPreferences: Preferences {
    func getCurrency() -> Currency? {
        .init(code: "PLN")
    }
    
    func setCurrency(_ currency: Currency) {}
}
