//
//  Created by Maciej Górecki on 11/10/2021
//

import SwiftUI

struct TitledMoneyLabel: View {
    let title: String
    let value: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.gray)
            
            Text(NumberFormatter.currency(from: value))
                .font(.title)
        }
        .foregroundColor(.white)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

struct TitledMoneyLabel_Previews: PreviewProvider {
    static var previews: some View {
        TitledMoneyLabel(title: "Test", value: 3_000)
            .padding()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
