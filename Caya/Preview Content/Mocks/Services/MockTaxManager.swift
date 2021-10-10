//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

struct MockTaxManager: TaxManaging {
    func getUserTaxes() -> [String] {
        ["VAT", "ZUS"]
    }
}
