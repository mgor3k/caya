//
//  Created by Maciej Górecki on 09/10/2021
//

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
    
    func storeEntry(_ entry: Entry) {
        
    }
}
