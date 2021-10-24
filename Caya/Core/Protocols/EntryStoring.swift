//
//  Created by Maciej Górecki on 17/10/2021
//

import Foundation

protocol EntryStoring {
    func storeEntry(_ entry: Entry)
    func updateEntry(withUUID uuid: UUID, entry: Entry)
}
