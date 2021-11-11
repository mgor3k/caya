//
//  Created by Maciej Górecki on 11/10/2021
//

import SwiftUI

struct MoneyInputTextField: View {
    let title: String
    let currencySymbol: String
    @Binding var value: Double?
    
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.footnote)
//                .foregroundColor(.gray)
            
            HStack {
                Text(currencySymbol)
                    .font(.title3)
                
                Spacer()
                
                TextField("-", value: $value, formatter: Self.formatter)
                    .font(.body)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
//                    .allowsHitTesting(false)
            }
        }
        .foregroundColor(.white)
        .padding(.vertical, 12)
//        .padding()
//        .overlay(
//            RoundedRectangle(cornerRadius: 16)
//                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
//        )
    }
}

struct MoneyInputTextField_Previews: PreviewProvider {
    static var previews: some View {
        MoneyInputTextField(
            title: "Test",
            currencySymbol: "$",
            value: .constant(3_000)
        )
            .padding()
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
