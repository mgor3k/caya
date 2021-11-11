//
//  Created by Maciej Gorecki on 12/11/2021
//

import Foundation

protocol CurrencyRepositoryProtocol {
    // TODO: Update this to Currency
    func fetchCurrencies() async -> [String]
}

final class CurrencyRepository: CurrencyRepositoryProtocol {
    func fetchCurrencies() async -> [String] {
        Locale.isoCurrencyCodes
    }
}
