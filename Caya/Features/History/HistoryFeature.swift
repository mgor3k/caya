//
//  Created by Maciej Gorecki on 11/11/2021
//

import SwiftUI

struct HistoryFeature: View {
    let dependencies: Dependencies
    let action: (Action) -> Void
    
    var body: some View {
        HistoryView(
            store: .init(
                repository: dependencies.repository,
                preference: dependencies.preferences
            ),
            onAdd: {
                action(.new)
            },
            onEdit: {
                action(.edit($0))
            }
        )
    }
}

extension HistoryFeature {
    enum Action {
        case new
        case edit(Entry)
    }
}
