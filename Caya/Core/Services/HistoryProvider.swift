//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation

protocol HistoryProviding {
    func getHistory() async -> [HistoryEntry]
}

struct HistoryProvider: HistoryProviding {
    func getHistory() async -> [HistoryEntry] {
        [
            .init(
                month: .init(4)!,
                year: .init(2010)!,
                income: 6_000,
                expenses: 1_000,
                taxes: [
                
                ]
            ),
            .init(
                month: .init(5)!,
                year: .init(2010)!,
                income: 5_000,
                expenses: 4_000,
                taxes: [
                
                ]
            )
        ]
    }
}
