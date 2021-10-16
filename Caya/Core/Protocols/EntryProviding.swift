//
//  Created by Maciej Górecki on 17/10/2021
//

import Combine

protocol EntryProviding {
    func getEntries() -> [Entry]
    func getEntriesUpdates() -> AnyPublisher<[Entry], Never>
}
