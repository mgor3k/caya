//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

extension HomeScene {
    typealias ViewModel = HomeViewModel
}

class HomeViewModel: ObservableObject {
    @Published var history: [HistoryEntry] = []
    
    private let provider: HistoryProviding
    
    var savings: Double {
        history.map(\.savings).reduce(0, +)
    }
    
    init(
        provider: HistoryProviding
    ) {
        self.provider = provider
    }
    
    func fetchHistory() async {
        history = await provider.getHistory()
    }
}
