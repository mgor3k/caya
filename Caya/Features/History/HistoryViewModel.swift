//
//  Created by Maciej Górecki on 09/10/2021
//

import Combine
import Foundation

class HistoryViewModel: ObservableObject {
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

private extension HistoryViewModel {
    func setupBindings() {
        repository
            .getEntriesUpdates()
            .map(\.groupedByYear)
            .assign(to: &$sections)
    }
}
