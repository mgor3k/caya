//
//  Created by Maciej Gorecki on 11/11/2021
//

import SwiftUI

struct CreditsFeature: View {
    let dependencies: Dependencies
    
    var body: some View {
        CreditsView(
            store: .init(
                repository: dependencies.credits
            )
        )
    }
}
