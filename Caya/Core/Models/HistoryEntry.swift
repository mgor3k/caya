//
//  Created by Maciej Górecki on 02/10/2021
//

import Foundation

struct HistoryEntry: Identifiable {
    typealias Tax = (name: String, tax: Double)
    
    let id = UUID()
    let month: Month
    let year: Year
    
    let income: Double
    let expenses: Double
    let taxes: [Tax]
}

extension HistoryEntry {
    var savings: Double {
        income - expenses - taxes.map(\.tax).reduce(0, +)
    }
}
