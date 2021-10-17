//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

struct Year: Hashable {
    let value: Int
    
    init?(_ value: Int) {
        if 2000...2050 ~= value {
            self.value = value
        } else {
            return nil
        }
    }
}

extension Year: Comparable {
    static func < (lhs: Year, rhs: Year) -> Bool {
        lhs.value < rhs.value
    }
}
