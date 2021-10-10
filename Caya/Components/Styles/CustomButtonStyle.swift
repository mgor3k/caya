//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
