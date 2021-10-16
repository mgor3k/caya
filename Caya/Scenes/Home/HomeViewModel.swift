//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

extension HomeScene {
    typealias ViewModel = HomeViewModel
}

class HomeViewModel: ObservableObject {
    @Published var history: [HistoryEntry] = []
        
    var savings: Double {
        history.map(\.savings).reduce(0, +)
    }
    
    init(
        provider: PersistanceManaging
    ) {
        history = provider.getEntries()
    }
}
