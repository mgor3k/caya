//
//  Created by Maciej Gorecki on 11/11/2021
//

import SwiftUI

struct EntryDetailsFeature: View {
    let dependencies: Dependencies
    let mode: Mode
    
    var body: some View {
        NewEntryView(
            store: .init(controller)
        )
    }
    
    var controller: EntryViewModelProtocol {
        switch mode {
        case .new:
            return NewEntryController(
                preferences: dependencies.preferences,
                repository: dependencies.repository
            )
        case let .edit(entry):
            return EditEntryController(
                entry: entry,
                preferences: dependencies.preferences,
                repository: dependencies.repository
            )
        }
    }
}

extension EntryDetailsFeature {
    enum Mode {
        case new
        case edit(Entry)
    }
}
