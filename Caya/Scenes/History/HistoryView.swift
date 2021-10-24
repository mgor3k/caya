//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct HistoryView: View {
    let sections: [HistorySection]
    let currency: Currency
    
    let onDelete: (Entry) -> Void
    
    var body: some View {
        List {
            Section {
                Text("Your **History**")
                    .padding(.horizontal, Padding.screenEdge)
                    .font(.title)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(sections) { section in
                Section {
                    ForEach(section.entries) { entry in
                        HistoryCell(entry: entry, currency: currency)
                            .transition(.scale)
                            .padding(
                                .bottom,
                                sections.last == section && section.isLast(entry) ? 100 : 0
                            )
                    }
                    .onDelete { row in
                        onDelete(section.entries[row.first!])
                    }
                } header: {
                    Text("\(section.title)")
                        .font(.title3)
                        .tracking(6)
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
        .animation(
            .spring().delay(0.2),
            value: sections
        )
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            sections: [MockPersistanceManager.entries].flatMap(\.groupedByYear),
            currency: .euro,
            onDelete: { _ in }
        )
    }
}
