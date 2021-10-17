//
//  Created by Maciej Górecki on 16/10/2021
//

import Foundation

// TODO: Make this a wrapper, with a formatter, etc
struct Currency: Codable {
    let code: String
    
    init(code: String) {
        self.code = code
    }
    
    var symbol: String {
        "$"
    }
}
