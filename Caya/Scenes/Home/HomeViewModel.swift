//
//  Created by Maciej Górecki on 09/10/2021
//

import Combine

extension HomeScene {
    typealias ViewModel = HomeViewModel
}

class HomeViewModel: ObservableObject {
    @Published var history: [Entry]
        
    var savings: Double {
        history.map(\.savings).reduce(0, +)
    }
    
    private let provider: EntryProviding
    private var subscriptions: Set<AnyCancellable> = []
    
    init(
        provider: EntryProviding
    ) {
        self.provider = provider
        self.history = provider.getEntries()
        setupBindings()
    }
}

private extension HomeViewModel {
    func setupBindings() {
        provider
            .getEntriesUpdates()
            .assign(to: &$history)
    }
}
