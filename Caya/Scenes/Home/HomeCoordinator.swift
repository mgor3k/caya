//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

struct HomeCoordinator: View {
    @Environment(\.dependencies) var dependencies

    var body: some View {
        HomeScene(
            viewModel: .init(
                provider: dependencies.historyProvider
            )
        )
    }
}
