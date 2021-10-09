//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

extension HomeScene {
    typealias ViewModel = HomeViewModel
}

class HomeViewModel: ObservableObject {
    @Published var history: [HistoryEntry] = []
    @Published var hasCurrent = false
    
    private let provider: HistoryProviding
    
    init(provider: HistoryProviding) {
        self.provider = provider
    }
    
    func fetchHistory() async {
        history = await provider.getHistory()
    }
}
