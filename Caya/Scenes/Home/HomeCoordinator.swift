//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

struct HomeCoordinator: View {
    @Environment(\.dependencies) var dependencies
    @State private var isShowingAdd = false

    var body: some View {
        HomeView(
            viewModel: .init(
                provider: dependencies.persistance,
                preference: dependencies.preferences
            ),
            onAdd: {
                isShowingAdd = true
            }
        )
            .sheet(isPresented: $isShowingAdd) {
                NewEntryView(
                    viewModel: .init(
                        preferences: dependencies.preferences,
                        persistance: dependencies.persistance
                    )
                )
            }
    }
}
