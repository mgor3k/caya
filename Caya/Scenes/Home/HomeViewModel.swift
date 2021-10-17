//
//  Created by Maciej Górecki on 09/10/2021
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var sections: [HomeSection]
        
    var savings: Double {
        sections.flatMap(\.entries).map(\.savings).reduce(0, +)
    }
    
    private let provider: EntryProviding
    private var subscriptions: Set<AnyCancellable> = []
    
    init(
        provider: EntryProviding
    ) {
        self.provider = provider
        self.sections = [provider.getEntries()].flatMap(\.groupedByYear)
        
        setupBindings()
    }
}

private extension HomeViewModel {
    func setupBindings() {
        provider
            .getEntriesUpdates()
            .map(\.groupedByYear)
            .assign(to: &$sections)
    }
}

private extension Collection where Element == Entry {
    var groupedByYear: [HomeSection] {
        let groupedByYear = Dictionary(grouping: self, by: { $0.date.year })
        return groupedByYear.keys
            .map { HomeSection(year: $0, entries: groupedByYear[$0]?.sorted(by: { $0.date.month > $1.date.month }) ?? []) }
            .sorted(by: { $0.title > $1.title })
    }
}
