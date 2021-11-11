//
//  Created by Maciej Górecki on 09/10/2021
//

struct Dependencies {
    let preferences: Preferences
    let repository: EntryRepositoryProtocol
    let credits: CreditsRepositoryProtocol
}

extension Dependencies {
    static let live = Dependencies(
        preferences: Defaults(.standard),
        repository: EntryRepository(storage: .init(inMemory: false)),
        credits: CreditsRepository()
    )
}
