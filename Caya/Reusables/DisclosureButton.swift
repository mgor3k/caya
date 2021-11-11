//
//  Created by Maciej Gorecki on 12/11/2021
//

import SwiftUI

struct DisclosureButton: View {
    let title: LocalizedStringKey
    let action: () -> Void
    
    init(
        _ title: LocalizedStringKey,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: "chevron.forward")
            }
        }
        .buttonStyle(CustomButtonStyle())
    }
}

struct DisclosureButton_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureButton("Test", action: {})
    }
}
