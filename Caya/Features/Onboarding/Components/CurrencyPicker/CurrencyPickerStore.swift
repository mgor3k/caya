//
//  Created by Maciej Górecki on 17/10/2021
//

import Foundation

final class CurrencyPickerStore: ObservableObject {
    @Published var selection: String = "EUR"
    @Published var searchPhrase: String = ""
    
    @Published var currencies: [String] = []
    
    private let preferences: Preferences
    private let currencyRepository: CurrencyRepositoryProtocol
    
    init(
        preferences: Preferences,
        currencyRepository: CurrencyRepositoryProtocol
    ) {
        self.preferences = preferences
        self.currencyRepository = currencyRepository
    }
    
    func storeSelection() async {
        preferences.currencyCode = selection
    }
    
    func fetch() async {
        currencies = await currencyRepository.fetchCurrencies()
    }
}
