//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

class NewEntryViewModel: ObservableObject {
    @Published var income: Double?
    @Published var expenses: Double?
    @Published var date: EntryDate
    
    let currency: Currency
    let disabledDates: [EntryDate]
    
    private let onSave: (Entry) -> Void
    private let entry: Entry?
    
    var isEditing: Bool {
        entry != nil
    }
    
    init(_ controller: EntryViewModelProtocol) {
        self.currency = Currency(code: controller.currencyCode)
        self.disabledDates = controller.disabledDates
        self.entry = (controller as? EntryEditing)?.entry
        self.onSave = controller.storeEntry
        self.date = controller.selectedDate
        
        income = entry?.income
        expenses = entry?.expenses
    }
    
    func save() {
        let entry = Entry(
            date: date,
            income: income,
            expenses: expenses,
            taxes: []
        )
        onSave(entry)
    }
}

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
