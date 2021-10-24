//
//  Created by Maciej Górecki on 24/10/2021
//

import Foundation

extension Collection where Element == Entry {
    var groupedByYear: [HistorySection] {
        let groupedByYear = Dictionary(grouping: self, by: { $0.date.year })
        return groupedByYear.keys
            .map { HistorySection(year: $0, entries: groupedByYear[$0]?.sorted(by: { $0.date.month > $1.date.month }) ?? []) }
            .sorted(by: { $0.title > $1.title })
    }
}
