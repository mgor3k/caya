//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

struct Year {
    let value: Int
    
    init?(_ value: Int) {
        if 2000...2050 ~= value {
            self.value = value
        } else {
            return nil
        }
    }
}
