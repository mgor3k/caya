//
//  Created by Maciej Górecki on 16/10/2021
//

import Foundation

struct Currency {
    private let formatter: NumberFormatter
    
    init(code: String) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = code
        self.formatter = formatter
    }
    
    var symbol: String {
        formatter.currencySymbol
    }
    
    func formatted(_ value: Double) -> String {
        formatter.string(from: NSNumber(value: value))!
    }
}
