//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

// TODO: Refactor
protocol EntryViewModelProtocol {
    var preferences: Preferences { get }
    var repository: EntryRepositoryProtocol { get }
    
    var disabledDates: [EntryDate] { get }
    var currencyCode: String { get }
    var selectedDate: EntryDate { get }
    
    func storeEntry(_ entry: Entry)
}

protocol EntryEditing {
    var entry: Entry { get }
}

extension EntryViewModelProtocol {
    var disabledDates: [EntryDate] {
        repository.getEntries().map(\.date)
    }
    
    var currencyCode: String {
        preferences.currencyCode!
    }
}
