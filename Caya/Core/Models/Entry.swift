//
//  Created by Maciej Górecki on 02/10/2021
//

import Foundation

struct Entry: Identifiable {
    typealias Tax = (name: String, tax: Double)
    
    var id = UUID()
    // TODO: Add computed properties for month and year
    let date: EntryDate
    
    let income: Double?
    let expenses: Double?
    let taxes: [Tax]
}

extension Entry {
    var savings: Double {
        (income ?? 0) - (expenses ?? 0) - taxes.map(\.tax).reduce(0, +)
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        lhs.id == rhs.id
    }
}
