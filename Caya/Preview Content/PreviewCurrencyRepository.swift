//
//  Created by Maciej Gorecki on 12/11/2021
//

import Foundation

struct PreviewCurrencyRepository: CurrencyRepositoryProtocol {
    func fetchCurrencies() async -> [String] {
        ["Test", "Test2"]
    }
}
