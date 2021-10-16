//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

struct HomeCoordinator: View {
    @Environment(\.dependencies) var dependencies
    @State private var isShowingAdd = false

    var body: some View {
        HomeScene(
            viewModel: .init(
                provider: dependencies.persistance
            ),
            onAdd: {
                isShowingAdd = true
            }
        )
            .sheet(isPresented: $isShowingAdd) {
                NewEntryView(
                    viewModel: .init(
                        preferences: dependencies.preferences
                    )
                )
            }
    }
}
