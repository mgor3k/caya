//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

extension NumberFormatter {
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.currencyCode = "PLN"
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static func currency(from value: Double) -> String {
        currency.string(from: NSNumber(value: value)) ?? ""
    }
}
