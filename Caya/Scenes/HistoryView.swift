//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

struct HistoryView: View {
    let entry: HistoryEntry
    
    init(_ entry: HistoryEntry) {
        self.entry = entry
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(entry.month)")
                .bold()
                .padding(12)
                .background(Color.white.opacity(0.2))
                .cornerRadius(14)
            
            Text("September")
                .font(.subheadline)
                .bold()
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text("PLN 14,000")
                    .font(.headline)
                
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
                month: 8,
                year: 2019,
                income: 3000,
                expenses: 4000,
                taxes: []
            )
        )
            .padding()
            .background(Color.black)
            .environment(\.colorScheme, .dark)
            .previewLayout(.sizeThatFits)
    }
}
