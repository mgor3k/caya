//
//  Created by Maciej Górecki on 16/10/2021
//

import Foundation

protocol Preferences {
    func setCurrency(_ currency: Currency)
    func getCurrency() -> Currency?
}

class Defaults {
    let defaults: UserDefaults
    
    init(_ defaults: UserDefaults) {
        self.defaults = defaults
    }
}

extension Defaults: Preferences {
    func setCurrency(_ currency: Currency) {
        let encoded = try? JSONEncoder().encode(currency)
        defaults.set(encoded, forKey: Self.key)
    }
    
    func getCurrency() -> Currency? {
        guard let data = defaults.data(forKey: Self.key) else {
            return nil
        }
        
        return try? JSONDecoder().decode(Currency.self, from: data)
    }
}

private extension Defaults {
    static let key = "currency"
}
