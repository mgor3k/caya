//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

struct EntryDate: Hashable, Equatable, Identifiable {
    let month: Month
    let year: Year
    
    var id: String {
        "\(year.value)+\(month.value)"
    }
}
