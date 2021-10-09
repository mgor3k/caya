//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

extension String {
    static func twoDigited(_ value: Int) -> String {
        String(format: "%02d", value)
    }
}
