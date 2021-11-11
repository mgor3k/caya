//
//  Created by Maciej Gorecki on 11/11/2021
//

import Combine
import Foundation

final class HistoryStore: ObservableObject {
    @Published var sections: [HistorySection]
    @Published var selectedMenuItem: HomeFeature.Page = .home
        
    var savings: Double {
        sections.flatMap(\.entries).map(\.savings).reduce(0, +)
    }
    
    let currency: Currency
    
    // TODO: Change naming
    private let repository: EntryRepositoryProtocol
    private var subscriptions: Set<AnyCancellable> = []
    
    init(
        repository: EntryRepositoryProtocol,
        preference: Preferences
    ) {
        self.repository = repository
        self.sections = [repository.getEntries()].flatMap(\.groupedByYear)
        self.currency = Currency(code: preference.currencyCode!)
        setupBindings()
    }
    
    func deleteEntry(_ entry: Entry) {
        repository.removeEntries([entry])
    }
}

private extension HistoryStore {
    func setupBindings() {
        repository
            .getEntriesUpdates()
            .map(\.groupedByYear)
            .assign(to: &$sections)
    }
}

private extension Collection where Element == Entry {
    var groupedByYear: [HistorySection] {
        let groupedByYear = Dictionary(grouping: self, by: { $0.date.year })
        return groupedByYear.keys
            .map { HistorySection(year: $0, entries: groupedByYear[$0]?.sorted(by: { $0.date.month > $1.date.month }) ?? []) }
            .sorted(by: { $0.title > $1.title })
    }
}
