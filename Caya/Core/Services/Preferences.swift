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
        
    }
    
    func getCurrency() -> Currency? {
        .init(code: "PLN")
    }
}
