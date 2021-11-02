//
//  Created by Maciej Gorecki on 02/11/2021
//

import Foundation
import Combine

final class PreviewEntryRepository: EntryRepositoryProtocol {
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
    
    func removeEntries(_ entries: [Entry]) {}
    func storeEntry(_ entry: Entry) {}
    func updateEntry(withUUID uuid: UUID, entry: Entry) {}
}
