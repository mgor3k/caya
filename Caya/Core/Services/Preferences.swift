//
//  Created by Maciej Górecki on 16/10/2021
//

import Foundation

protocol Preferences: AnyObject {
    var currencyCode: String? { get set }
}

class Defaults {
    let defaults: UserDefaults
    
    init(_ defaults: UserDefaults) {
        self.defaults = defaults
    }
}

extension Defaults: Preferences {
    var currencyCode: String? {
        get {
            defaults.string(forKey: Self.key)
        }
        set {
            defaults.set(newValue, forKey: Self.key)
        }
    }
}

private extension Defaults {
    static let key = "currency"
}
