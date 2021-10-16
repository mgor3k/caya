//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

class NewEntryViewModel: ObservableObject {
    let taxes: [String]
    
    init(taxManager: TaxManaging) {
        self.taxes = taxManager.getUserTaxes()
    }
}
