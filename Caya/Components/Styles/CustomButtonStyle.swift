//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var isEnabled = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .contentShape(Rectangle())
            .opacity(isEnabled && configuration.isPressed ? 0.7 : 1)
    }
}
