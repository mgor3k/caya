//
//  Created by Maciej Górecki on 09/10/2021
//

struct MockHistoryProvider: HistoryProviding {
    static let entries: [HistoryEntry] = [
        .init(
            month: .january,
            year: .init(2010)!,
            income: 5_000,
            expenses: 4_000,
            taxes: [
            
            ]
        )
    ]
    
    func getHistory() async -> [HistoryEntry] {
        Self.entries
    }
}
