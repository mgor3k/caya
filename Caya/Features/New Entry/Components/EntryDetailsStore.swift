//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation

final class EntryDetailsStore: ObservableObject {
    @Published var sections: [Section]
    
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
        
        sections = [
            .init(title: "General", rows: [
                .init(title: "Income", value: entry?.income),
                .init(title: "Expenses", value: entry?.expenses)
            ])
        ]
    }
    
    func save() {
        let entry = Entry(
            date: date,
            income: sections[0].rows[0].value,
            expenses: sections[0].rows[1].value,
            taxes: []
        )
        onSave(entry)
    }
}

extension EntryDetailsStore {
    class Section: Identifiable, ObservableObject {
        let title: String
        @Published var rows: [Row]
        
        init(title: String, rows: [Row]) {
            self.title = title
            self.rows = rows
        }
        
        var id: String {
            title
        }
    }
    
    class Row: ObservableObject, Identifiable {
        let title: String
        var value: Double?
        
        init(title: String, value: Double?) {
            self.title = title
            self.value = value
        }
        
        var id: String {
            title
        }
    }
}
