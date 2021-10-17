//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static func currency(from value: Double, code: String) -> String {
        currency.currencyCode = code
        return currency.string(from: NSNumber(value: value)) ?? ""
    }
}
