//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct KeyValueView: View {
    let key: String
    let value: String
    
    var body: some View {
        HStack {
            Text(key)
                .bold()
            Spacer()
            Text(value)
        }
        .font(.title2)
        .padding(16)
        .padding(.horizontal, 8)
        .background(
            Color.white
                .opacity(0.1)
        )
        .cornerRadius(16)
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView(key: "Income", value: "$500,00")
            .padding()
            .background(Color.background)
            .environment(\.colorScheme, .dark)
            .previewLayout(.sizeThatFits)
    }
}
