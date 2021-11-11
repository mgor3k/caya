//
//  Created by Maciej Górecki on 09/10/2021
//

import Foundation
import SwiftUI

struct HistoryEntryView: View {
    let entry: Entry
    let currency: Currency
    
    var body: some View {
        HStack(spacing: 16) {
            Text(String.twoDigited(entry.date.month.value))
                .bold()
                .padding(12)
                .background(Color.white.opacity(0.2))
                .cornerRadius(14)
            
            Text(entry.date.month.symbol)
                .font(.subheadline)
                .bold()
            
            Spacer()
            
            Text(currency.formatted(entry.savings))
                .font(.headline)
        }
    }
}

struct HistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        HistoryEntryView(
            entry: .init(
                date: .init(
                    month: .january,
                    year: .init(2009)!
                ),
                income: 10_000,
                expenses: 4_000,
                taxes: []
            ),
            currency: .euro
        )
            .padding()
            .background(Color.black)
            .environment(\.colorScheme, .dark)
            .previewLayout(.sizeThatFits)
    }
}
