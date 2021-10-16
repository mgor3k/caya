//
//  Created by Maciej Górecki on 09/10/2021
//

import Combine

extension HomeScene {
    typealias ViewModel = HomeViewModel
}

class HomeViewModel: ObservableObject {
    @Published var history: [Entry] = []
        
    var savings: Double {
        history.map(\.savings).reduce(0, +)
    }
    
    private let persistance: PersistanceManaging
    private var subscriptions: Set<AnyCancellable> = []
    
    init(
        provider: PersistanceManaging
    ) {
        self.persistance = provider
        setupBindings()
    }
    
    func update() {
        history = persistance.getEntries()
    }
}

private extension HomeViewModel {
    func setupBindings() {
        persistance
            .listenForEntryChanges()
            .sink { [weak self] _ in
                self?.update()
            }
            .store(in: &subscriptions)
    }
}
