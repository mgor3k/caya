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
    
    private let persistance: PersistanceManaging
    
    init(preferences: Preferences, persistance: PersistanceManaging) {
        self.currency = Currency(code: preferences.currencyCode!)
        self.persistance = persistance
        
        // TODO: Make this better 
        let components = Calendar.current.dateComponents([.month, .year], from: .now)
        let currentYear = components.year!
        let currentMonth = components.month!
        
        // FIX: check last available date
        date = EntryDate(month: .init(currentMonth)!, year: .init(currentYear)!)
        
        // TODO: To be optimised
        disabledDates = persistance.getEntries().map(\.date)
    }
    
    func save() {
        let entry = Entry(
            date: date,
            income: income,
            expenses: expenses,
            taxes: []
        )
        persistance.storeEntry(entry)
    }
}
