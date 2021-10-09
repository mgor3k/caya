//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

struct HistorySectionView: View {
    let entries: [HistoryEntry]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Your ")
                .font(.title)
            +
            Text("History")
                .font(.title)
                .bold()
            
            ScrollView {
                LazyVStack {
                    ForEach(entries) { entry in
                        HistoryView(entry)
                    }
                }
            }
        }
    }
}

struct HistorySectionView_Previews: PreviewProvider {
    static var previews: some View {
        HistorySectionView(
            entries: MockHistoryProvider.entries
        )
            .background(Color.background)
            .environment(\.colorScheme, .dark)
            .previewLayout(.fixed(width: 300, height: 400))
    }
}
