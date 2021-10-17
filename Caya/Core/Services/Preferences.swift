//
//  Created by Maciej Górecki on 16/10/2021
//

import Foundation

protocol Preferences {
    func getCurrency() -> Currency?
}

class Defaults {
    let defaults: UserDefaults
    
    init(_ defaults: UserDefaults) {
        self.defaults = defaults
    }
}

extension Defaults: Preferences {
    func getCurrency() -> Currency? {
        .init("PLN")
    }
}
