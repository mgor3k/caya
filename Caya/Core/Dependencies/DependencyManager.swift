//
//  Created by Maciej Górecki on 09/10/2021
//

final class DependencyManager {
    let preferences: Preferences
    let repository: EntryRepository
    
    init(inMemory: Bool = false) {
        preferences = Defaults(.standard)
        repository = EntryRepository(storage: .init(inMemory: inMemory))
    }
}
