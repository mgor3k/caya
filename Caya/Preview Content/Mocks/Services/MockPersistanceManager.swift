//
//  Created by Maciej Górecki on 09/10/2021
//

import Combine

struct MockPersistanceManager: PersistanceManaging {
    static let entries: [Entry] = [
        .init(
            date: .init(
                month: .january,
                year: .init(2010)!
            ),
            income: 5_000,
            expenses: 4_000,
            taxes: [
            
            ]
        )
    ]
    
    func getEntries() -> [Entry] {
        Self.entries
    }
    
    func getEntriesUpdates() -> AnyPublisher<[Entry], Never> {
        Just(Self.entries).eraseToAnyPublisher()
    }
    
    func storeEntry(_ entry: Entry) {
        
    }
}
