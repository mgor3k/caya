//
//  Created by Maciej Górecki on 11/10/2021
//

import SwiftUI

struct TitledMoneyLabel: View {
    let title: String
    let currency: String
    let value: Double
        
    @State private var text = "4,000.00"
    
    init(
        title: String,
        currency: String,
        value: Double
    ) {
        self.title = title
        self.currency = currency
        self.value = value
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.gray)
            
            HStack {
                Text(currency)
                    .font(.title3)
                
                Spacer()
                
                TextField("-", text: $text)
                    .font(.title)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
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
        TitledMoneyLabel(
            title: "Test",
            currency: "$",
            value: 3_000
        )
            .padding()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}