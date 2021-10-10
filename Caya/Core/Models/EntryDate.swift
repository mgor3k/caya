//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

struct EntryDate: Hashable {
    let month: Month
    let year: Year
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(month.value)
        hasher.combine(year.value)
    }
}
