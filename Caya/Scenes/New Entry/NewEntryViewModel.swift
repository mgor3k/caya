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
        
        let components = Calendar.current.dateComponents([.month, .year], from: .now)
        let currentYear = components.year!
        let currentMonth = components.month!
        
        var date: EntryDate = EntryDate(month: .init(currentMonth)!, year: .init(currentYear)!)
        
        disabledDates = persistance.getEntries().map(\.date)
        
        // Get the closes date available
        while disabledDates.contains(where: { $0 == date }) {
            if let newMonth = date.month - 1 {
                date = EntryDate(month: newMonth, year: date.year)
            } else if let newYear = date.year - 1, let newMonth = Month(12) {
                date = EntryDate(month: newMonth, year: newYear)
            } else {
                break
            }
        }
        
        self.date = date
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
