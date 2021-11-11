//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct HistoryView: View {
    @StateObject var store: HistoryStore
    
    let onAdd: () -> Void
    let onEdit: (Entry) -> Void
    
    var body: some View {
        List {
            titleHeader
            sections
        }
        .listStyle(.plain)
        .animation(
            .spring(),
            value: store.sections
        )
        .navigationTitle(store.currency.formatted(store.savings))
        .toolbar {
            Button(action: onAdd) {
                Image(systemName: "plus.app.fill")
            }
            .foregroundColor(Color(uiColor: .label))
        }
    }
}

extension HistoryView {
    var titleHeader: some View {
        Section {
            Text("Your **History**")
                .padding(.horizontal, Padding.screenEdge)
                .font(.title)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .listSectionSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
    }
    
    var sections: some View {
        ForEach(store.sections) { section in
            Section {
                ForEach(section.entries) { entry in
                    viewForEntry(entry)
                }
                .onDelete { row in
                    store.deleteEntry(section.entries[row.first!])
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
    
    func viewForEntry(_ entry: Entry) -> some View {
        Button(action: { onEdit(entry) }) {
            HistoryEntryView(entry: entry, currency: store.currency)
                .transition(.scale)
        }
        .buttonStyle(CustomButtonStyle())
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            store: .init(
                repository: PreviewEntryRepository(),
                preference: MockPreferences()
            ),
            onAdd: {},
            onEdit: { _ in }
        )
    }
}
