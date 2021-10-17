//
//  Created by Maciej Górecki on 16/10/2021
//

import Foundation

struct Currency: Codable {
    let code: String
    
    init(code: String) {
        self.code = code
    }
    
    var symbol: String {
        "$"
    }
}
