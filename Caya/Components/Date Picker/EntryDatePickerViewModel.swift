//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

extension EntryDatePicker {
    typealias ViewModel = EntryDatePickerViewModel
}

class EntryDatePickerViewModel: ObservableObject {
    let entries: [EntryDate]
    let disabledEntries: [EntryDate]
    
    @Published var selected: EntryDate
    
    // TODO: To be fixed
    init() {
        let components = Calendar.current.dateComponents([.year, .month], from: .now)
        let currentYear = components.year!
        let currentMonth = components.month!
        
        let years = Array(currentYear-1...currentYear)
        
        let current = years.compactMap(Year.init)
            .flatMap { year in
                (1...(year.value == currentYear ? currentMonth : 12)).compactMap(Month.init).compactMap { EntryDate(month: $0, year: year) }
            }
        
        entries = current.reversed()
        selected = current.last!
        disabledEntries = [.init(month: .init(8)!, year: .init(2021)!)]
    }
}
