//
//  Created by Maciej Górecki on 17/10/2021
//

import Foundation

struct HistorySection: Equatable {
    private let year: Year
    let entries: [Entry]
    
    init(year: Year, entries: [Entry]) {
        self.year = year
        self.entries = entries
    }
    
    var title: String {
        "\(year.value)"
    }
    
    func isLast(_ entry: Entry) -> Bool {
        entries[entries.count - 1] == entry
    }
}

extension HistorySection: Identifiable {
    var id: Int {
        year.value
    }
}
