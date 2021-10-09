//
//  Created by Maciej Górecki on 02/10/2021
//

import Foundation

struct HistoryEntry {
    typealias Tax = (name: String, tax: Double)
    
    let month: Int
    let year: Int
    
    let income: Double
    let expenses: Double
    let taxes: [Tax]
}
