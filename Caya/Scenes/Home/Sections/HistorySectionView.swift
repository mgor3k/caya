//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

struct HistorySectionView: View {
    let entries: [Entry]
    
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
                            .transition(.scale)
                    }
                }
                .animation(.spring().delay(0.2), value: entries)
            }
        }
    }
}

struct HistorySectionView_Previews: PreviewProvider {
    static var previews: some View {
        HistorySectionView(
            entries: MockPersistanceManager().getEntries()
        )
            .background(Color.background)
            .environment(\.colorScheme, .dark)
            .previewLayout(.fixed(width: 300, height: 400))
    }
}
