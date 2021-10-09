//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

struct Month {
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
