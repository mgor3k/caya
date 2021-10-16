//
//  Created by Maciej Górecki on 11/10/2021
//

import SwiftUI

struct MoneyInputTextField: View {
    let title: String
    let currency: String
    @Binding var value: Double?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.gray)
            
            HStack {
                Text(currency)
                    .font(.title3)
                
                Spacer()
                
                TextField("-", value: $value, format: .currency(code: "US"))
                    .font(.title)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .allowsHitTesting(false)
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

struct MoneyInputTextField_Previews: PreviewProvider {
    static var previews: some View {
        MoneyInputTextField(
            title: "Test",
            currency: "$",
            value: .constant(3_000)
        )
            .padding()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
