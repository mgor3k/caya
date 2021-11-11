//
//  Created by Maciej Górecki on 24/10/2021
//

import Foundation

struct EditEntryController: EntryViewModelProtocol, EntryEditing {
    let entry: Entry
    let preferences: Preferences
    let repository: EntryRepositoryProtocol
    
    var selectedDate: EntryDate {
        entry.date
    }
    
    var disabledDates: [EntryDate] {
        // FIX: all except selected date
        var dates = repository.getEntries().map(\.date)
        dates.removeAll(where: { $0 == entry.date })
        return dates
    }
    
    func storeEntry(_ entry: Entry) {
        repository.updateEntry(withUUID: self.entry.id, entry: entry)
    }
}
