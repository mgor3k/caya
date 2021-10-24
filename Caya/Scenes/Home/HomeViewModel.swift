//
//  Created by Maciej Górecki on 09/10/2021
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var sections: [HistorySection]
    @Published var selectedMenuItem: HomeMenuItem = .home
        
    var savings: Double {
        sections.flatMap(\.entries).map(\.savings).reduce(0, +)
    }
    
    let currency: Currency
    
    // TODO: Change naming
    private let provider: EntryProviding
    private var subscriptions: Set<AnyCancellable> = []
    
    init(
        provider: EntryProviding,
        preference: Preferences
    ) {
        self.provider = provider
        self.sections = [provider.getEntries()].flatMap(\.groupedByYear)
        self.currency = Currency(code: preference.currencyCode!)
        
        setupBindings()
    }
    
    func deleteEntry(_ entry: Entry) {
        provider.removeEntries([entry])
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
