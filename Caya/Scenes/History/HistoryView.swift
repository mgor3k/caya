//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel: HistoryViewModel
    let onAdd: () -> Void
    let onEdit: (Entry) -> Void
    
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
            
            ForEach(viewModel.sections) { section in
                Section {
                    ForEach(section.entries) { entry in
                        Button(action: { onEdit(entry) }) {
                            HistoryCell(entry: entry, currency: viewModel.currency)
                                .transition(.scale)
                                .padding(
                                    .bottom,
                                    viewModel.sections.last == section && section.isLast(entry) ? 100 : 0
                            )
                        }
                        .buttonStyle(CustomButtonStyle())
                    }
                    .onDelete { row in
                        viewModel.deleteEntry(section.entries[row.first!])
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
            .spring(),
            value: viewModel.sections
        )
        .navigationTitle(viewModel.currency.formatted(viewModel.savings))
        .toolbar {
            Button(action: onAdd) {
                Image(systemName: "plus.app.fill")
            }
            .foregroundColor(Color(uiColor: .label))
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            viewModel: .init(
                repository: PreviewEntryRepository(),
                preference: MockPreferences()
            ),
            onAdd: {},
            onEdit: { _ in }
        )
    }
}
