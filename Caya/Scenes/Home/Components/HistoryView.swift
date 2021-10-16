//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI
import Foundation

struct HistoryView: View {
    let entry: Entry
    
    init(_ entry: Entry) {
        self.entry = entry
    }
    
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
            
            VStack(alignment: .trailing, spacing: 6) {
                Text(NumberFormatter.currency(from: entry.savings))
                    .font(.headline)
                
                // TODO: Compute
                Text("-20%")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            .init(
                date: .init(
                    month: .january,
                    year: .init(2009)!
                ),
                income: 10_000,
                expenses: 4_000,
                taxes: []
            )
        )
            .padding()
            .background(Color.black)
            .environment(\.colorScheme, .dark)
            .previewLayout(.sizeThatFits)
    }
}
