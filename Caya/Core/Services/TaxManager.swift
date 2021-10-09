//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

protocol TaxManaging {
    func getUserTaxes() -> [String]
}

struct TaxManager: TaxManaging {
    let defaults: UserDefaults
    
    func getUserTaxes() -> [String] {
        return [
            "ZUS",
            "PIT",
            "VAT"
        ]
    }
}
