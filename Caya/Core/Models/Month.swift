//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

struct Month: Hashable {
    let value: Int
    
    init?(_ value: Int) {
        if 1...12 ~= value {
            self.value = value
        } else {
            return nil
        }
    }
}

extension Month {
    static let dateFormatter = DateFormatter()
    
    var symbol: String {
        Self.dateFormatter.monthSymbols[value - 1]
    }
}

extension Month: Comparable {
    static func < (lhs: Month, rhs: Month) -> Bool {
        lhs.value < rhs.value
    }
    
    static func - (lhs: Month, rhs: Int) -> Month? {
        Month(lhs.value - rhs)
    }
}
