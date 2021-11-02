//
//  Created by Maciej Górecki on 24/10/2021
//

import Foundation

struct NewEntryController: EntryViewModelProtocol {
    let preferences: Preferences
    let repository: EntryRepositoryProtocol
    
    var selectedDate: EntryDate {
        let components = Calendar.current.dateComponents([.month, .year], from: .now)
        let currentYear = components.year!
        let currentMonth = components.month!
        
        var date: EntryDate = EntryDate(month: .init(currentMonth)!, year: .init(currentYear)!)
        
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
        
        return date
    }
    
    func storeEntry(_ entry: Entry) {
        repository.storeEntry(entry)
    }
}
